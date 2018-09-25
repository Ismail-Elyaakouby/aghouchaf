pipeline {
     agent any
     //parameters {
      //   string(name: 'PERSON', defaultValue: 'Mr Jenkins', description: 'Who should I say hello to?')
     //}
     tools { 
         maven 'Maven3.3.3' 
         //maven 'Maven3.5.2'
     }
 
     //agent {
      //   docker {
     //        image 'maven:3-alpine' 
      //       args '-v /root/.m2:/root/.m2' 
       //  }
     //}
     stages { 
         //slackSend (color: '#FFFF00', message: "STARTED: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' (${env.BUILD_URL})")
         stage ('Compile Stage') {
 	     when { branch 'master' }
             //steps {
             //    sh 'mvn clean compile'
             //}
 
             steps {
                 script {
                     sh 'mvn clean compile'
                     sh 'echo $PERSON'
                 }
             }
            post {
                failure {
                    echo 'FAILED (in stage Compile)'
                }
            }
 
         }
         stage ('Testing Stage') {
 	     when { branch 'master' }
             //steps {
             //    sh 'mvn test'
             //}
             steps {
                 script {
                     sh 'mvn test'
                 }
             }
            post {
                failure {
                    echo 'FAILED (in stage Testing)'
                }
            }
         }
         stage ('Deployment Stage') {
 	     when { branch 'master' }
             steps {
                 script {
                sh 'mvn deploy'
 		//sh 'mvn deploy:deploy-file -Durl=http://192.168.1.11:8081/repository/mvn-release/ -Dfile=/var/jenkins_home/.m2/repository/ma/saucelabs/sauce_appium_junit/0.0.9/smail.jar -DgroupId=ma.saucelabs -DartifactId=sauce_appium_junit -Dpackaging=jar -Dversion=0.0.9'
                 }
             }
            post {
                failure {
                    echo 'FAILED (in stage deploy)'
                }
            }
         }
 //        stage ('Release Stage') {
 //	     when { branch 'master' }
 //            steps {
 //                script {
 //               sh 'mvn clean install package'
 //               sh 'mvn release:clean'
 //              // sh 'mvn release:prepare'
 //               sh 'mvn release:prepare -Darguments="-Dcmd.env=dev -Dcmd.parent.sys=soa"'
 //		//sh 'mvn deploy:deploy-file -Durl=http://192.168.1.11:8081/repository/mvn-release/ -Dfile=/var/jenkins_home/.m2/repository/ma/saucelabs/sauce_appium_junit/0.0.9/smail.jar -DgroupId=ma.saucelabs -DartifactId=sauce_appium_junit -Dpackaging=jar -Dversion=0.0.9'
 //               }
 //            }
 //        }
 	
 	stage('SonarQube analysis') {
 	     when { branch 'master' }
             steps {
                 script {
                     //sh "mvn sonar:sonar -Dsonar.host.url=http://192.168.43.55:80811 -Dsonar.login=57f1b5c979c1618e43077fdfab801de05d2ede6e" 
                    sh "mvn sonar:sonar -Dsonar.host.url=http://192.168.2.129:19000 -Dsonar.login=admin -Dsonar.password=admin"
 			sh 'echo analise sonar'
                 }
             }
            post {
                failure {
                    echo 'FAILED (in stage sonar)'
                }
            }
        }
    }
    post {
        always {
            echo 'COMPLETED (global)'
        }
        failure {
            echo 'FAILED (global)'
        }
    }
}
