pipeline {
  agent any

  parameters {
    choice(name:'Branch',choices:['branch_1','branch_2'],description:'Select the Branch')
    choice(name: 'action', choices: ['plan','apply','destroy'], description: 'Terraform action to perform')
    booleanParam(name:'ApplyApproval',defaultValue:false,description:'Are you confirming terraform apply')
    booleanParam(name:'DestroyApproval',defaultValue:false,description:'Are you confirming terraform destroy')
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
    stage('Terraform Run') {
      steps{
      script{
      if(params.action == 'plan'){
        bat 'C:\\Users\\kesavank\\Terraform\\terraform plan'
      }
      else if (params.action == 'apply'){
        if(params.ApplyApproval){
          bat 'C:\\Users\\kesavank\\Terraform\\terraform apply -auto-approve'
        }
      }
      else if (params.action == 'destroy'){
        if(params.DestroyApproval){
          bat 'C:\\Users\\kesavank\\Terraform\\terraform destroy -auto-approve'
        }
      }
      }
      }
    }
  }
}

        /* def userInput = input(
                        id: 'ApplyTerraformChanges',
                        message: 'Are you sure you want to apply Terraform changes?',
                        parameters: [
                            [$class: 'BooleanParameterDefinition',
                             name: 'Proceed',
                             defaultValue: false] 
                        ]
                    )
                    env.USER_INPUT = userInput.toString()
                    if (env.USER_INPUT == 'true') {
                              bat 'C:\\Users\\kesavank\\Terraform\\terraform apply -auto-approve'
                    } 
        
      }
      }
    }
    }
  }
}*/

        
      
      /*steps {
            //bat 'C:\\Users\\kesavank\\Terraform\\terraform plan'
      //}
    
    //stage('Terraform Apply Confirmation') {
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
                    env.USER_INPUT = userInput.toString()

                    
                }
            }
        }
    stage('Terraform Apply') {
      when {
        expression {return params.action == 'apply' && env.USER_INPUT == 'true'}
      }
      steps {
          bat "C:\\Users\\kesavank\\Terraform\\terraform apply -auto-approve"
    }
  }
  stage('Terraform destroy confirmation'){
    when{
      expression {return params.action == 'destroy'}
    }
    steps{
      script{
        def userInput=input(
          id:'Destroytheresources',
          message:'Are you sure you want to destroy Terraform resources?',
          parameters:[
            [$class: 'BooleanParameterDefinition',
             name:'Proceed',
             defaultValue:false]
          ]
        
        )
        env.USER_INPUT=userInput.toString()
      }
    }
  }
  stage('Terraform destroy'){
    when{
        expression { return params.action == 'destroy' && env.USER_INPUT == 'true'}

    }
    steps{
        bat "C:\\Users\\kesavank\\Terraform\\terraform destroy -auto-approve"
    }
  }
    }*/

    