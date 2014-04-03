project 'my name', 'example.com' do

  model_version '1.0.0'

  parent 'example', 'parent', '1.1' do
    relative_path '../pom.xml'
  end

  id 'example', 'project', '1.1'

  packaging 'jar'

  description 'some description'
  
  inception_year 2020

  organization 'ngo', 'ngo.org'

  license 'AGPL', 'gnu.org/agpl' do
    distribution 'online'
    comments 'should be used more often'
  end

  developer '1', 'first', 'example.com/first', 'first@example.com' do
    organization 'orga'
    organization_url 'example.org'
    roles 'developer', 'architect'
    timezone 'IST'
    properties[ :gender ] = :male
  end

  contributor 'first', 'example.com/first', 'first@example.com' do
    organization 'orga'
    organization_url 'example.org'
    roles 'developer', 'architect'
    timezone 'IST'
    properties[ :gender ] = :male
  end

  mailing_list 'development' do
    subscribe 'subcribe@example.com'
    unsubscribe 'unsubcribe@example.com'
    post 'post@example.com'
    archive 'example.com/archive'
    other_archives 'example.com/archive1', 'example.com/archive2'
  end

  prerequisites do
    maven '3.0.5'
  end

  modules 'part1', 'part2'

  scm( 'scm:git:git://github.com/torquebox/maven-tools.git',
       'scm:git:ssh://git@github.com/torquebox/maven-tools.git',
       'http://github.com/torquebox/maven-tools',
       :tag => 'first' )
  issue_management( 'https://issues.sonatype.org/', 
                    :system => 'jira' )
  ci_management( 'travis-ci.org/jruby/jruby',
                 :system => 'travis' ) do
    notifier( 'email', 'mail2@example.com' )
    notifier( 'email', 'mail@example.com',
              :send_on_error => true,
              :send_on_failure => false,
              :send_on_success =>true,
              :send_on_warning => false,
              :configuration => { :key1 => 'value1',
                :key2 => 'value2' } )
  end 
  distribution( 'active',
                'http://dev.example.com/downloads' ) do
    repository( :first, 
                'http://repo.example.com',
                'First',
                :unique_version => 123,
                :layout => 'legacy' ) do
      releases( :enabled => true,
                :update_policy => 'daily',
                :checksum_policy => :strict )
      snapshots( :enabled =>false,
                 :update_policy => :never,
                 :checksum_policy => 'none' )
    end
    snapshot_repository( 'snapshots', 
                         'http://snaphots.example.com',
                         'First Snapshots',
                         :unique_version => 1234,
                         :layout => 'legacy' ) do
      releases( :enabled => false,
                :update_policy => 'daily',
                :checksum_policy => :strict )
      snapshots( :enabled =>true,
                 :update_policy => :never,
                 :checksum_policy => 'none' )
    end
    site( 'first','http://dev.example.com', 'dev site'  )
    relocation( 'org.group', 'artifact', '1.2.3',
                :message => 'follow the maven convention' )
  end
  properties :key1 => 'value1', 'key2' => :value2
  scope :provided do
    dependency_management do
      jar( 'com.example', 'tools', '1.2.3',
           :classifier => 'super',
           :system_path => '/home/development/tools.jar',
           :exclusions => [ 'org.example:some', 'org.example:something' ],
           :optional => true )
    end
    war( 'com.example', 'tools', '2.3',
         :classifier => 'super',
         :system_path => '/home/development/wartools.jar',
         :exclusions => [ 'org.example:some', 'org.example:something' ],
         :optional => false )
  end
  repository( 'first', 'http://repo.example.com', 'First' ) do
    unique_version 123
    layout 'legacy'
    releases( :enabled => true,
              :update_policy => 'daily',
              :checksum_policy => :strict )
    snapshots( :enabled => false,
               :update_policy => :never,
               :checksum_policy => 'none' )
  end
  snapshot_repository( 'snapshots', 
                       'http://snaphots.example.com',
                       'First Snapshots',
                       :unique_version => 12345,
                       :layout => 'legacy' ) do
    releases( :update_policy => 'daily',
              :checksum_policy => :strict )
    snapshots( :update_policy => :never,
               :checksum_policy => 'none' )
  end
  plugin_repository( :first, 'http://pluginrepo.example.com', 'First' ) do
    unique_version 12
    layout 'legacy'
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
    extension 'org.group', 'gem-extension', '1.2'
    resource do
      target_path 'target'
      filtering true
      directory 'resources'
      includes [ '**/*' ]
      excludes [ '*~' ]
    end
    test_resource do
      target_path 'target/test'
      filtering false
      directory 'testresources'
      includes [ '**/*' ]
      excludes [ '*~' ]
    end
  end
end

#   <build>
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
