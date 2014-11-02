#
# Copyright (C) 2013 Christian Meier
#
# Permission is hereby granted, free of charge, to any person obtaining a copy of
# this software and associated documentation files (the "Software"), to deal in
# the Software without restriction, including without limitation the rights to
# use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
# the Software, and to permit persons to whom the Software is furnished to do so,
# subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
# FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
# COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
# IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
# CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
#
require 'fileutils'
require 'yaml'
begin
  require 'jar_dependencies'
rescue LoadError
  # we do not declare jar-dependencies gem as dependency
end
module Maven
  module Tools
    module DSL
    class JarfileLock
      
      def initialize( jarfile )
        @file = File.expand_path( jarfile + ".lock" )
        if File.exists?( @file )
          data = YAML.load( File.read( @file ) )
          @data = data if data.is_a? Hash
        end
      end
      
      def dump
        if @data
          File.write( @file, @data.to_yaml )
        else
          FileUtils.rm_f( @file )
        end
      end

      def coordinates( scope = :runtime )
        data[ scope ] || []
      end

      # TODO should move into jbundler
      def require( scope = :runtime )
        coordicates( scope ).each do |coord|
          Jars.require_jar( coord.split( /:/ ) )
        end
      end
      
      # TODO should move into jbundler
      def classpath( scope = :runtime )
        coordicates( scope ).collect do |coord|
          path_to_jar( coord.split( /:/ ) )
        end
      end

      # TODO should move into jbundler
      def downloaded?
        classpath.member?( nil ) == false &&
          classpath( :test ).member?( nil ) == false
      end

      def replace( deps )
        data.clear
        update( deps )
      end

      def update_unlocked( deps )
        conflict = true
        d = data
        deps.each do |k,v|
          if exists?( e.coord )
            # do nothing
          elsif locked?( e.coord )
            # mark result as conflict
            conflict = false
          else
            # add it
            d[ k ] = v.collect{ |e| e.coord }
          end
        end
        conflict
      end

      def exists?( coordinate )
        coordinates( :runtime ) + coordinates( :test ).member?( coordinate )
      end

      def locked?( coordinate )
        coord = coordinate.sub(/^([^:]+:[^:]+):.+/) { $1 }
        all = coordinates( :runtime ) + coordinates( :test )
        all.detect do |l|
          l.sub(/^([^:]+:[^:]+):.+/) { $1 } == coord 
        end != nil
      end

      private

      def data
        @data ||= {}
      end

      # TODO should move into jar-dependencies
      def to_path( group_id, artifact_id, *classifier_version )
        version = classifier_version[ -1 ]
        classifier = classifier_version[ -2 ]

        jar = to_jar( group_id, artifact_id, version, classifier )
        ( [ Jars.home ] + $LOAD_PATH ).each do |path|
          if File.exists?( f = File.join( path, jar ) )
            return f
          end
        end
        nil
      end

      def to_jar( group_id, artifact_id, version, classifier )
        file = "#{group_id.gsub( /\./, '/' )}/#{artifact_id}/#{version}/#{artifact_id}-#{version}"
        file << "-#{classifier}" if classifier
        file << '.jar'
        file
      end

    end
    end
  end
end