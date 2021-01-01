pipeline {
    agent {
        docker {
            image 'qaninja/python-wd'
            args '--network=zepalheta-network'
        }
    }

    stages {
        stage('Build') {
            steps {
                sh 'pip install -r requirements.txt'
            }
        }
        stage('API Tests') {
            steps {
                sh 'robot -d logs/ tests/api/'
            }
        }
        stage('UI Tests') {
            steps {
                sh 'robot -d logs/ -v browser:headless tests/web/'
            }
        }
        
    }

    post {
        always {
            robot 'logs'
        }
    }
}
