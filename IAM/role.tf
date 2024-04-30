
resource "aws_iam_policy" "iam_create_role_policy" {
  name = var.aws_iam_policy

  policy = jsonencode({

    "Version" : "2012-10-17",
    "Statement" : [
      {

        "Effect" : "Allow",
        "Action" : "iam:CreateRole",
        "Resource" : "*"
      }
    ]
    }
  )
}


resource "aws_iam_role_policy_attachment" "attach_create_role_policy" {
  role       = aws_iam_role.iam_role.name
  policy_arn = aws_iam_policy.iam_create_role_policy.arn
}

resource "aws_iam_role" "iam_role" {
  name = var.aws_iam_role

  assume_role_policy = jsonencode(
    {
      "Version" : "2012-10-17",
      "Statement" : [
        {
          "Effect" : "Allow",
          "Principal" : {
            "Service" : "ec2.amazonaws.com"
          },

          "Action" : "sts:AssumeRole"

        }
      ]

    }
  )
}