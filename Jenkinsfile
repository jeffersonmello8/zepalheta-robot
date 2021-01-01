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
                sh 'robot -d logs/api/ tests/api/'
            }
        }
        stage('UI Tests') {
            steps {
                sh 'robot -d logs/web/ -v browser:headless tests/web/'
            }
        }
        
    }

    post {
        always {
            robot disableArchiveOutput: true, logFileName: '**/log.html', otherFiles: '**/*.png,**/*.jpg', outputFileName: '**/output.xml', outputPath: 'logs', reportFileName: '**/report.html'
        }
    }
}
