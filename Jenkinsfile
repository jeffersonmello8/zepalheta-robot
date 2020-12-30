pipeline {
    agent {
        docker {
            image 'python'
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
        
    }
    
    post {
        always {
            robot 'logs'
        }
    }
}
