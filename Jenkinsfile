node {
   def mvnHome
   def javaHome
   stage('Init') { // for display purposes
      // Get some code from a GitHub repository
      git 'https://github.com/ArunKumarJ/grpc-application.git'
      // Get the Maven tool.
      // ** NOTE: This 'M3' Maven tool must be configured
      // **       in the global configuration.           
      mvnHome = tool 'maven-3.5.4'
	  javaHome = tool 'JDK-12'
   }
   stage('Build') {
      // Run the maven build
      withEnv(["MVN_HOME=$mvnHome"]) {
         if (isUnix()) {
            sh '"$MVN_HOME/bin/mvn" -Dmaven.test.failure.ignore clean package'
         } else {
            bat(/"%MVN_HOME%\bin\mvn" clean package/)
         }
      }
   }
   stage('Build Docker Image') {
	 def buildDockerImage = 'docker build -t arun/grpc-service:1.0.0 .'
	 if (isUnix()) {
		sh '"$buildDockerImage"'
	 } else {
		bat(/"%buildDockerImage%"/)
	 }
   }
}