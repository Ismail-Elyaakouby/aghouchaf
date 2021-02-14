#!groovy

node('slave-maven-01') {

    currentBuild.result = "SUCCESS"

    try {

       stage('Checkout'){

          checkout scm
       }

       stage('Test'){

         env.NODE_ENV = "test"

         print "Environment will be : ${env.NODE_ENV}"

         sh 'mvn -B -DskipTests clean install -Dmaven.clean.failOnError=false'

       }

       stage('Build Docker'){

            sh 'docker build -f Dockerfile -t hellowordv01 .'
       }

       stage('Deploy'){

         echo 'Push to Repo'
        //sh './dockerPushToRepo.sh'

       }
    }
    catch (err) {

        currentBuild.result = "FAILURE"

            mail body: "project build error is here: ${env.BUILD_URL}" ,
            from: 'elyakouby@gmail.com',
            replyTo: 'elyakouby@gmail.com',
            subject: 'project build failed',
            to: 'elyakouby@gmail.com'

        throw err
    }

}
