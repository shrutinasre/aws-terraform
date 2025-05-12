
resource "aws_s3_bucket" "dependingbucket001" {
  bucket = "dependingbucket001"

  tags = {
    Name = "dependingbucket001"
    Environment = "Dev"
    }

    depends_on = [ aws_route_table_association.public-sub-association ] //Example on explicit dependency - bucket will be created only after creating route table association named as public-sub-association
}

resource "aws_s3_bucket" "dependingbucket002" {
  bucket = "dependingbucket002"

  tags = {
    Name = "dependingbucket002"
    Environment = "Test"
    }

    depends_on = [ aws_s3_bucket.dependingbucket001 ] //Nested Dependendecy
}

resource "aws_s3_bucket" "dependingbucket003" {
  bucket = "dependingbucket003"

  tags = {
    Name = "dependingbucket003"
    Environment = "Prod"
    }

    depends_on = [ aws_s3_bucket.dependingbucket002 ] //Nested Dependendecy
}