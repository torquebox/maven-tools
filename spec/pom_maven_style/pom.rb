project do

  model_version '1.0.0'

  parent 'example:parent:1.1' do
    relative_path '../pom.xml'
  end

  id 'example:project:1.1'

  packaging 'jar'

  name 'my name'
  
  url 'example.com'

  description 'some description'
  
  inception_year 2020

  organization do
    name 'ngo'
    url 'ngo.org'
  end

  license do
    name 'AGPL'
    url 'gnu.org/agpl'
    distribution 'online'
    comments 'should be used more often'
  end

  developer do
    id '1'
    name 'first'
    email 'first@example.com'
    url 'example.com/first'
    organization 'orga'
    organization_url 'example.org'
    roles 'developer', 'architect'
    timezone 'IST'
    properties :gender => :male
  end

  contributor do
    name 'first'
    email 'first@example.com'
    url 'example.com/first'
    organization 'orga'
    organization_url 'example.org'
    roles 'developer', 'architect'
    timezone 'IST'
    properties :gender => :male
  end

  mailing_list do
    name 'development'
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

  scm do
    connection 'scm:git:git://github.com/torquebox/maven-tools.git'
    developer_connection 'scm:git:ssh://git@github.com/torquebox/maven-tools.git'
    tag 'first'
    url 'http://github.com/torquebox/maven-tools'
  end
  issue_management do
    system 'jira'
    url 'https://issues.sonatype.org/'
  end
  ci_management do
    url 'travis-ci.org/jruby/jruby'
    system 'travis'
    notifier do
      type 'email'
      address 'mail2@example.com'
    end
    notifier do
      type 'email'
      address 'mail@example.com'
      send_on_error true
      send_on_failure false
      send_on_success true
      send_on_warning false
      configuration :key1 => 'value1', :key2 => 'value2'
    end
  end
  distribution do
    status 'active'
    download_url 'http://dev.example.com/downloads'
    repository do
      id :first
      url 'http://repo.example.com'
      name 'First'
      unique_version 123
      layout 'legacy'
      releases do 
        enabled true
        update_policy 'daily'
        checksum_policy :strict
      end
      snapshots do 
        enabled false
        update_policy :never
        checksum_policy 'none'
      end
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
    site do
      id 'first'
      url 'http://dev.example.com'
      name 'dev site'
    end
    relocation( 'org.group:artifact:1.2.3' ) do
      message 'follow the maven convention'
    end
  end
  properties :key1 => 'value1', 'key2' => :value2
  dependency_management do
    jar( 'com.example:tools:1.2.3' ) do
      classifier 'super'
      scope 'provided'
      system_path '/home/development/tools.jar'
      optional true
      exclusion 'org.example:some'
      exclusion 'org.example', 'something'
    end
  end
  war( 'com.example:tools', '2.3' ) do
    classifier 'super'
    scope 'provided'
    system_path '/home/development/wartools.jar'
    optional false
    exclusion 'org.example:some'
    exclusion 'org.example', 'something'
  end
  repository do
    id :first
    url 'http://repo.example.com'
    name 'First'
    unique_version 123
    layout 'legacy'
    releases do 
      enabled true
      update_policy 'daily'
      checksum_policy :strict
    end
    snapshots do 
      enabled false
      update_policy :never
      checksum_policy 'none'
    end
  end
  snapshot_repository do
    id 'snapshots'
    url 'http://snaphots.example.com'
    name 'First Snapshots'
    unique_version 12345
    layout 'legacy'
    releases do 
      update_policy 'daily'
      checksum_policy :strict
    end
    snapshots do
      update_policy :never
      checksum_policy 'none'
    end
  end
  plugin_repository do
    id :first
    url 'http://pluginrepo.example.com'
    name 'First'
    unique_version 12
    layout 'legacy'
    releases do 
      enabled true
      update_policy 'daily'
      checksum_policy :strict
    end
    snapshots do 
      enabled false
      update_policy :never
      checksum_policy 'none'
    end
  end
  build do
    source_directory 'src'
    script_source_directory 'script'
    test_source_directory 'test'
    output_directory 'pkg'
    test_output_directory 'pkg/test'
    default_goal :install
    extension 'org.group:gem-extension:1.2'
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
