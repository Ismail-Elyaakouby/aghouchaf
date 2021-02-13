node('slave-maven-01'){
  stage('compile') {
    sh '''echo  stage1 steps'''
    sh '''mvn clean compile'''
  }
  stage('deploy') {
  sh '''echo stage2 steps'''
  sh '''mvn clean deploy -DuniqueVersion=true'''
  }
  stage('stage3') {
  sh '''echo stage3 steps'''
  }
}
