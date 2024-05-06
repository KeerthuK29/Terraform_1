pipeline {
  agent any

  parameters {
    choice(name:'Branch',choices:['branch_1','branch_2'],description:'Select the Branch')
    choice(name: 'action', choices: ['plan','apply','destroy'], description: 'Terraform action to perform')
  }
   environment {
        AWS_ACCESS_KEY_ID     = credentials('aws-access-key-id')
        AWS_SECRET_ACCESS_KEY = credentials('aws-secret-access-key')
    
    }

  stages {
    stage('Checkout Code') {
      
      steps {
        script{
      
        git branch: "${params.Branch}" , url:'https://github.com/KeerthuK29/Terraform_1.git'
        }
      }
    }
    stage('Terraform Initialize'){
      steps{
          bat 'C:\\Users\\kesavank\\Terraform\\terraform init'
        
      }
    }
    stage('Terraform Plan') {
      when {
        expression { return params.action == 'plan' }
      }
      steps {
            bat 'C:\\Users\\kesavank\\Terraform\\terraform plan'
      }
    }
    stage('Terraform Apply Confirmation') {
            when {
                expression { return params.action == 'apply' }
            }
            steps {
                script {
                    def userInput = input(
                        id: 'ApplyTerraformChanges',
                        message: 'Are you sure you want to apply Terraform changes?',
                        parameters: [
                            [$class: 'BooleanParameterDefinition',
                             name: 'Proceed',
                             defaultValue: false] 
                        ]
                    )

                    if (userInput) {
                        echo 'Applying Terraform changes...'
                    } else {
                        echo 'Terraform apply aborted by user.'
                        currentBuild.result = 'ABORTED'
                    }
                }
            }
        }
    stage('Terraform Apply ') {
      when {
        expression { return params.action == 'apply' && userInput}
      }
      steps {
          bat "C:\\Users\\kesavank\\Terraform\\terraform apply -auto-approve"
    }
  }
  stage('Terraform destroy'){
    when{
        expression {return params.action == 'destroy'}

    }
    steps{
        bat "C:\\Users\\kesavank\\Terraform\\terraform destroy -auto-approve"
    }
  }
}
}