pipeline {

	agent {label "server1"}

	stages {


			stage('Build docker image') {
				
				steps {
					sh 'docker build -t robotimage'
				}

			}
			

			stage('Test') {


				steps {


					sh '''
						git --version
						python test.py
						python test1.py
					'''
				}
		}
	}
}
