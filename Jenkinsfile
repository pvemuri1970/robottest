pipeline {

	agent {label "server1"}

	stages {

		stage('Test') {

			agent {dockerfile true}

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
