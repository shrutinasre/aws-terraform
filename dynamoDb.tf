resource "aws_dynamodb_table" "state-locking" {
  hash_key = "LockID"
  name = "dynamodb-state-locking"
  attribute {
    name = "LockID"
    type = "S"
  }
  billing_mode = "PAY_PER_REQUEST"
}