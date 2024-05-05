resource "aws_iam_policy" "rds_access_policy" {
  name        = "rds_access_policy"
  description = "Allow access for MySql Database connection"
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Action = [
        "rds:Describe*",
        "rds:AddDatabases",
        "rds:listDatabases"
      ],
      Effect   = "Allow",
      Resource = "*"
      }
    ]
  })
}
resource "aws_iam_role" "database_role" {
  name = "database_role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Sid    = "databaserole"
      Principal = {
        Service = "rds.amazonaws.com"
      }
    }]
  })

}
resource "aws_iam_policy_attachment" "attach_rds_policy" {
  name       = "db_policy_attachment"
  roles      = [aws_iam_role.database_role.name]
  policy_arn = aws_iam_policy.rds_access_policy.arn

}
