pipeline {

	agent {dockerfile true}

	stages {

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
