project :name => 'my name', :url => 'example.com' do

  model_version '1.0.1'

  parent( :group_id => 'example',
          :artifact_id => 'parent',
          :version => '1.1',
          :relative_path => '../pom.xml' )

  id( :group_id => 'example',
      :artifact_id => 'project',
      :version => '1.1' )

  packaging 'jar'

  description 'some description'
  
  inception_year 2020

  organization :name => 'ngo', :url => 'ngo.org'

  license( :name => 'AGPL', 
           :url => 'gnu.org/agpl',
           :distribution => 'online',
           :comments => 'should be used more often' )

  developer( :id => '1', 
             :name => 'first', 
             :url => 'example.com/first',
             :email => 'first@example.com',
             :organization => 'orga',
             :organization_url => 'example.org',
             :roles => [ 'developer', 'architect' ],
             :timezone => 'IST',
             :properties => { :gender => :male } )

  contributor( :name => 'first', 
               :url => 'example.com/first',
               :email => 'first@example.com',
               :organization => 'orga',
               :organization_url => 'example.org',
               :roles => [ 'developer', 'architect' ],
               :timezone => 'IST',
               :properties => { :gender => :male } )

  mailing_list( :name => 'development',
                :subscribe => 'subcribe@example.com',
                :unsubscribe => 'unsubcribe@example.com',
                :post => 'post@example.com',
                :archive => 'example.com/archive',
                :other_archives => [ 'example.com/archive1',
                                     'example.com/archive2' ] )

  prerequisites :maven => '3.0.5'

  modules 'part1', 'part2'
  
  scm( :connection => 'scm:git:git://github.com/torquebox/maven-tools.git',
       :developer_connection => 'scm:git:ssh://git@github.com/torquebox/maven-tools.git',
       :tag => 'first',
       :url => 'http://github.com/torquebox/maven-tools' )
  issue_management( :system => 'jira',
                    :url => 'https://issues.sonatype.org/' )
  ci_management( :system => 'travis',
                 :url => 'travis-ci.org/jruby/jruby' ) do
    notifier( :type => 'email',
              :address => 'mail2@example.com' )
    notifier( :type => 'email',
              :send_on_error => true,
              :send_on_failure => false,
              :send_on_success =>true,
              :send_on_warning => false,
              :address => 'mail@example.com',
              :configuration => { :key1 => 'value1',
                :key2 => 'value2' } )
  end
  distribution( :status => 'active',
                :download_url => 'http://dev.example.com/downloads' ) do
    repository( :unique_version => 123,
                :id => 'first',
                :name => 'First',
                :url => 'http://repo.example.com',
                :layout => 'legacy' ) do
      releases( :enabled => true,
                :update_policy => 'daily',
                :checksum_policy => :strict )
      snapshots( :enabled =>false,
                 :update_policy => :never,
                 :checksum_policy => 'none' )
    end
    snapshot_repository( :unique_version => 1234,
                         :id => 'snapshots',
                         :name => 'First Snapshots',
                         :url => 'http://snaphots.example.com',
                         :layout => 'legacy' ) do
      releases( :enabled => false,
                :update_policy => 'daily',
                :checksum_policy => :strict )
      snapshots( :enabled =>true,
                 :update_policy => :never,
                 :checksum_policy => 'none' )
    end
    site( :id => 'first',
          :name => 'dev site',
          :url => 'http://dev.example.com' )
    relocation( :group_id => 'org.group',
                :artifact_id => 'artifact',
                :version => '1.2.3',
                :message => 'follow the maven convention' )
  end
  properties :key1 => 'value1', 'key2' => :value2
  dependency_management do
    jar( :group_id => 'com.example',
         :artifact_id => 'tools',
         :version => '1.2.3',
         :classifier => 'super',
         :scope => 'provided',
         :system_path => '/home/development/tools.jar',
         :exclusions => [ { :group_id => 'org.example',
                            :artifact_id => 'some' },
                          { :group_id => 'org.example',
                            :artifact_id => 'something' } ],
         :optional => true )
  end
  war( :group_id => 'com.example',
       :artifact_id => 'tools',
       :version => '2.3',
       :classifier => 'super',
       :scope => 'provided',
       :system_path => '/home/development/wartools.jar',
       :exclusions => [ { :group_id => 'org.example',
                          :artifact_id => 'some' },
                        { :group_id => 'org.example',
                          :artifact_id => 'something' } ],
       :optional => false )
  repository( :id => 'first', 
              :url => 'http://repo.example.com', 
              :name => 'First',
              :unique_version => 123,
              :layout => 'legacy' ) do
    releases( :enabled => true,
              :update_policy => 'daily',
              :checksum_policy => :strict )
    snapshots( :enabled => false,
               :update_policy => :never,
               :checksum_policy => 'none' )
  end
  snapshot_repository( :id => 'snapshots', 
                       :url => 'http://snaphots.example.com',
                       :name => 'First Snapshots',
                       :unique_version => 12345,
                       :layout => 'legacy' ) do
    releases( :update_policy => 'daily',
              :checksum_policy => :strict )
    snapshots( :update_policy => :never,
               :checksum_policy => 'none' )
  end
  plugin_repository( :id => :first, 
                     :url => 'http://pluginrepo.example.com', 
                     :name => 'First',
                     :unique_version => 12,
                     :layout => 'legacy' ) do
    releases( :enabled => true,
              :update_policy => 'daily',
              :checksum_policy => :strict )
    snapshots( :enabled => false,
               :update_policy => :never,
               :checksum_policy => 'none' )
  end
  build do
    source_directory 'src'
    script_source_directory 'script'
    test_source_directory 'test'
    output_directory 'pkg'
    test_output_directory 'pkg/test'
    default_goal :install
    extension( :group_id => 'org.group', 
               :artifact_id => 'gem-extension',
               :version => '1.2' )
    resource( :target_path => 'target',
              :filtering => true,
              :directory => 'resources',
              :includes => [ '**/*' ],
              :excludes => [ '*~' ] )
    test_resource( :target_path => 'target/test',
                   :filtering => false,
                   :directory => 'testresources',
                   :includes => [ '**/*' ],
                   :excludes => [ '*~' ] )
  end
end


#   <dependencies>
#     <dependency>
#       <groupId/>
#       <artifactId/>
#       <version/>
#       <type/>
#       <classifier/>
#       <scope/>
#       <systemPath/>
#       <exclusions>
#         <exclusion>
#           <artifactId/>
#           <groupId/>
#         </exclusion>
#       </exclusions>
#       <optional/>
#     </dependency>
#   </dependencies>

#   <repositories>
#     <repository>
#       <releases>
#         <enabled/>
#         <updatePolicy/>
#         <checksumPolicy/>
#       </releases>
#       <snapshots>
#         <enabled/>
#         <updatePolicy/>
#         <checksumPolicy/>
#       </snapshots>
#       <id/>
#       <name/>
#       <url/>
#       <layout/>
#     </repository>
#   </repositories>
#   <pluginRepositories>
#     <pluginRepository>
#       <releases>
#         <enabled/>
#         <updatePolicy/>
#         <checksumPolicy/>
#       </releases>
#       <snapshots>
#         <enabled/>
#         <updatePolicy/>
#         <checksumPolicy/>
#       </snapshots>
#       <id/>
#       <name/>
#       <url/>
#       <layout/>
#     </pluginRepository>
#   </pluginRepositories>

#   <build>
#     <sourceDirectory/>
#     <scriptSourceDirectory/>
#     <testSourceDirectory/>
#     <outputDirectory/>
#     <testOutputDirectory/>
#     <extensions>
#       <extension>
#         <groupId/>
#         <artifactId/>
#         <version/>
#       </extension>
#     </extensions>
#     <defaultGoal/>
#     <resources>
#       <resource>
#         <targetPath/>
#         <filtering/>
#         <directory/>
#         <includes/>
#         <excludes/>
#       </resource>
#     </resources>
#     <testResources>
#       <testResource>
#         <targetPath/>
#         <filtering/>
#         <directory/>
#         <includes/>
#         <excludes/>
#       </testResource>
#     </testResources>
#     <directory/>
#     <finalName/>
#     <filters/>
#     <pluginManagement>
#       <plugins>
#         <plugin>
#           <groupId/>
#           <artifactId/>
#           <version/>
#           <extensions/>
#           <executions>
#             <execution>
#               <id/>
#               <phase/>
#               <goals/>
#               <inherited/>
#               <configuration/>
#             </execution>
#           </executions>
#           <dependencies>
#             <dependency>
#               <groupId/>
#               <artifactId/>
#               <version/>
#               <type/>
#               <classifier/>
#               <scope/>
#               <systemPath/>
#               <exclusions>
#                 <exclusion>
#                   <artifactId/>
#                   <groupId/>
#                 </exclusion>
#               </exclusions>
#               <optional/>
#             </dependency>
#           </dependencies>
#           <goals/>
#           <inherited/>
#           <configuration/>
#         </plugin>
#       </plugins>
#     </pluginManagement>
#     <plugins>
#       <plugin>
#         <groupId/>
#         <artifactId/>
#         <version/>
#         <extensions/>
#         <executions>
#           <execution>
#             <id/>
#             <phase/>
#             <goals/>
#             <inherited/>
#             <configuration/>
#           </execution>
#         </executions>
#         <dependencies>
#           <dependency>
#             <groupId/>
#             <artifactId/>
#             <version/>
#             <type/>
#             <classifier/>
#             <scope/>
#             <systemPath/>
#             <exclusions>
#               <exclusion>
#                 <artifactId/>
#                 <groupId/>
#               </exclusion>
#             </exclusions>
#             <optional/>
#           </dependency>
#         </dependencies>
#         <goals/>
#         <inherited/>
#         <configuration/>
#       </plugin>
#     </plugins>
#   </build>

#   <reports/>
#   <reporting>
#     <excludeDefaults/>
#     <outputDirectory/>
#     <plugins>
#       <plugin>
#         <groupId/>
#         <artifactId/>
#         <version/>
#         <reportSets>
#           <reportSet>
#             <id/>
#             <reports/>
#             <inherited/>
#             <configuration/>
#           </reportSet>
#         </reportSets>
#         <inherited/>
#         <configuration/>
#       </plugin>
#     </plugins>
#   </reporting>

#   <profiles>
#     <profile>
#       <id/>
#       <activation>
#         <activeByDefault/>
#         <jdk/>
#         <os>
#           <name/>
#           <family/>
#           <arch/>
#           <version/>
#         </os>
#         <property>
#           <name/>
#           <value/>
#         </property>
#         <file>
#           <missing/>
#           <exists/>
#         </file>
#       </activation>
#       <build>
#         <defaultGoal/>
#         <resources>
#           <resource>
#             <targetPath/>
#             <filtering/>
#             <directory/>
#             <includes/>
#             <excludes/>
#           </resource>
#         </resources>
#         <testResources>
#           <testResource>
#             <targetPath/>
#             <filtering/>
#             <directory/>
#             <includes/>
#             <excludes/>
#           </testResource>
#         </testResources>
#         <directory/>
#         <finalName/>
#         <filters/>
#         <pluginManagement>
#           <plugins>
#             <plugin>
#               <groupId/>
#               <artifactId/>
#               <version/>
#               <extensions/>
#               <executions>
#                 <execution>
#                   <id/>
#                   <phase/>
#                   <goals/>
#                   <inherited/>
#                   <configuration/>
#                 </execution>
#               </executions>
#               <dependencies>
#                 <dependency>
#                   <groupId/>
#                   <artifactId/>
#                   <version/>
#                   <type/>
#                   <classifier/>
#                   <scope/>
#                   <systemPath/>
#                   <exclusions>
#                     <exclusion>
#                       <artifactId/>
#                       <groupId/>
#                     </exclusion>
#                   </exclusions>
#                   <optional/>
#                 </dependency>
#               </dependencies>
#               <goals/>
#               <inherited/>
#               <configuration/>
#             </plugin>
#           </plugins>
#         </pluginManagement>
#         <plugins>
#           <plugin>
#             <groupId/>
#             <artifactId/>
#             <version/>
#             <extensions/>
#             <executions>
#               <execution>
#                 <id/>
#                 <phase/>
#                 <goals/>
#                 <inherited/>
#                 <configuration/>
#               </execution>
#             </executions>
#             <dependencies>
#               <dependency>
#                 <groupId/>
#                 <artifactId/>
#                 <version/>
#                 <type/>
#                 <classifier/>
#                 <scope/>
#                 <systemPath/>
#                 <exclusions>
#                   <exclusion>
#                     <artifactId/>
#                     <groupId/>
#                   </exclusion>
#                 </exclusions>
#                 <optional/>
#               </dependency>
#             </dependencies>
#             <goals/>
#             <inherited/>
#             <configuration/>
#           </plugin>
#         </plugins>
#       </build>

#       <modules/>

#       <distributionManagement>
#         <repository>
#           <uniqueVersion/>
#           <releases>
#             <enabled/>
#             <updatePolicy/>
#             <checksumPolicy/>
#           </releases>
#           <snapshots>
#             <enabled/>
#             <updatePolicy/>
#             <checksumPolicy/>
#           </snapshots>
#           <id/>
#           <name/>
#           <url/>
#           <layout/>
#         </repository>
#         <snapshotRepository>
#           <uniqueVersion/>
#           <releases>
#             <enabled/>
#             <updatePolicy/>
#             <checksumPolicy/>
#           </releases>
#           <snapshots>
#             <enabled/>
#             <updatePolicy/>
#             <checksumPolicy/>
#           </snapshots>
#           <id/>
#           <name/>
#           <url/>
#           <layout/>
#         </snapshotRepository>
#         <site>
#           <id/>
#           <name/>
#           <url/>
#         </site>
#         <downloadUrl/>
#         <relocation>
#           <groupId/>
#           <artifactId/>
#           <version/>
#           <message/>
#         </relocation>
#         <status/>
#       </distributionManagement>

#       <properties>
#         <key>value</key>
#       </properties>

#       <dependencyManagement>
#         <dependencies>
#           <dependency>
#             <groupId/>
#             <artifactId/>
#             <version/>
#             <type/>
#             <classifier/>
#             <scope/>
#             <systemPath/>
#             <exclusions>
#               <exclusion>
#                 <artifactId/>
#                 <groupId/>
#               </exclusion>
#             </exclusions>
#             <optional/>
#           </dependency>
#         </dependencies>
#       </dependencyManagement>
#       <dependencies>
#         <dependency>
#           <groupId/>
#           <artifactId/>
#           <version/>
#           <type/>
#           <classifier/>
#           <scope/>
#           <systemPath/>
#           <exclusions>
#             <exclusion>
#               <artifactId/>
#               <groupId/>
#             </exclusion>
#           </exclusions>
#           <optional/>
#         </dependency>
#       </dependencies>

#       <repositories>
#         <repository>
#           <releases>
#             <enabled/>
#             <updatePolicy/>
#             <checksumPolicy/>
#           </releases>
#           <snapshots>
#             <enabled/>
#             <updatePolicy/>
#             <checksumPolicy/>
#           </snapshots>
#           <id/>
#           <name/>
#           <url/>
#           <layout/>
#         </repository>
#       </repositories>
#       <pluginRepositories>
#         <pluginRepository>
#           <releases>
#             <enabled/>
#             <updatePolicy/>
#             <checksumPolicy/>
#           </releases>
#           <snapshots>
#             <enabled/>
#             <updatePolicy/>
#             <checksumPolicy/>
#           </snapshots>
#           <id/>
#           <name/>
#           <url/>
#           <layout/>
#         </pluginRepository>
#       </pluginRepositories>

#       <reports/>
#       <reporting>
#         <excludeDefaults/>
#         <outputDirectory/>
#         <plugins>
#           <plugin>
#             <groupId/>
#             <artifactId/>
#             <version/>
#             <reportSets>
#               <reportSet>
#                 <id/>
#                 <reports/>
#                 <inherited/>
#                 <configuration/>
#               </reportSet>
#             </reportSets>
#             <inherited/>
#             <configuration/>
#           </plugin>
#         </plugins>
#       </reporting>
#     </profile>
#   </profiles>
# </project>
