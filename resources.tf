locals {
  # `max_character_length` variable needs to be updated each time we want to add support for a resource. 
  #
  # Add a resource support by adding the information using this format:   
  # "<resource_type>" = <maximum_number_of_character_allowed> # <reference>
  #
  # The format of `resource_type` is taken from Terraform resource name by omitting `aws_` prefix.
  # For example:
  # * aws_db_parameter_group (https://www.terraform.io/docs/providers/aws/r/db_parameter_group.html) -->  db_parameter_group
  # * aws_lb (https://www.terraform.io/docs/providers/aws/r/lb.html)                                 -->  lb
  # * aws_s3_bucket (https://www.terraform.io/docs/providers/aws/r/s3_bucket.html)                   -->  s3_bucket
  max_character_length = {
    "autoscaling_group"                   = "255" # https://docs.aws.amazon.com/autoscaling/ec2/APIReference/API_CreateAutoScalingGroup.html
    "autoscaling_policy"                  = "255" # https://docs.aws.amazon.com/autoscaling/ec2/APIReference/API_PutScalingPolicy.html
    "cloudwatch_event_rule"               = "64"  # https://docs.aws.amazon.com/AmazonCloudWatchEvents/latest/APIReference/API_Rule.html
    "cloudwatch_log_group"                = "512" # https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_CreateLogGroup.html
    "codebuild_project"                   = "255" # https://docs.aws.amazon.com/codebuild/latest/APIReference/API_CreateProject.html#CodeBuild-CreateProject-request-name
    "db_instance"                         = "63"  # https://docs.aws.amazon.com/AmazonRDS/latest/APIReference/API_CreateDBInstance.html
    "db_parameter_group"                  = "255" # https://docs.aws.amazon.com/AmazonRDS/latest/APIReference/API_CreateDBParameterGroup.html
    "dynamodb_table"                      = "255" # https://docs.aws.amazon.com/amazondynamodb/latest/APIReference/API_CreateTable.html
    "ecr_repository"                      = "256" # https://docs.aws.amazon.com/AmazonECR/latest/APIReference/API_CreateRepository.html#ECR-CreateRepository-request-repositoryName
    "ecs_cluster"                         = "255" # https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_CreateCluster.html#ECS-CreateCluster-request-clusterName
    "ecs_service"                         = "255" # https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_CreateService.html#ECS-CreateService-request-serviceName
    "ecs_task_definition"                 = "255" # https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_RegisterTaskDefinition.html#ECS-RegisterTaskDefinition-request-family
    "elasticache_cluster"                 = "20"  # https://docs.aws.amazon.com/AmazonElastiCache/latest/APIReference/API_CreateCacheCluster.html
    "elasticache_parameter_group"         = "255" # https://docs.aws.amazon.com/AmazonElastiCache/latest/mem-ug/ParameterGroups.Creating.html
    "elasticsearch_domain"                = "28"  # https://docs.aws.amazon.com/elasticsearch-service/latest/developerguide/es-createupdatedomains.html#es-createdomains
    "iam_instance_profile"                = "128" # https://docs.aws.amazon.com/IAM/latest/APIReference/API_CreateInstanceProfile.html
    "iam_role"                            = "64"  # https://docs.aws.amazon.com/IAM/latest/APIReference/API_CreateRole.html
    "key_pair"                            = "255" # https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_CreateKeyPair.html
    "kinesis_firehose_delivery_stream"    = "64"  # https://docs.aws.amazon.com/firehose/latest/APIReference/API_CreateDeliveryStream.html
    "lambda_function"                     = "140" # https://docs.aws.amazon.com/lambda/latest/dg/API_CreateFunction.html
    "launch_configuration"                = "255" # https://docs.aws.amazon.com/autoscaling/ec2/APIReference/API_CreateLaunchConfiguration.html
    "lb"                                  = "32"  # https://docs.aws.amazon.com/elasticloadbalancing/latest/APIReference/API_CreateLoadBalancer.html
    "lb_target_group"                     = "32"  # https://docs.aws.amazon.com/elasticloadbalancing/latest/APIReference/API_CreateTargetGroup.html
    "s3_bucket"                           = "63"  # https://docs.aws.amazon.com/AmazonS3/latest/dev/BucketRestrictions.html
    "security_group"                      = "255" # https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_CreateSecurityGroup.html
    "sns_topic"                           = "256" # https://docs.aws.amazon.com/sns/latest/api/API_CreateTopic.html
    "sqs_queue"                           = "80"  # https://docs.aws.amazon.com/AWSSimpleQueueService/latest/APIReference/API_CreateQueue.html
    "waf_byte_match_set"                  = "128" #	https://docs.aws.amazon.com/waf/latest/APIReference/API_CreateByteMatchSet.html
    "waf_geo_match_set"                   = "128" #	https://docs.aws.amazon.com/waf/latest/APIReference/API_CreateGeoMatchSet.html
    "waf_ipset"                           = "128" #	https://docs.aws.amazon.com/waf/latest/APIReference/API_CreateIPSet.html
    "waf_rate_based_rule"                 = "128" #	https://docs.aws.amazon.com/waf/latest/APIReference/API_CreateRateBasedRule.html
    "waf_regex_match_set"                 = "128" #	https://docs.aws.amazon.com/waf/latest/APIReference/API_CreateRegexMatchSet.html
    "waf_regex_pattern_set"               = "128" #	https://docs.aws.amazon.com/waf/latest/APIReference/API_CreateRegexPatternSet.html
    "waf_rule"                            = "128" #	https://docs.aws.amazon.com/waf/latest/APIReference/API_CreateRule.html
    "waf_rule_group"                      = "128" #	https://docs.aws.amazon.com/waf/latest/APIReference/API_CreateRuleGroup.html
    "waf_size_constraint_set"             = "128" #	https://docs.aws.amazon.com/waf/latest/APIReference/API_CreateSizeConstraintSet.html
    "waf_sql_injection_match_set"         = "128" #	https://docs.aws.amazon.com/waf/latest/APIReference/API_CreateSqlInjectionMatchSet.html
    "waf_web_acl"                         = "128" #	https://docs.aws.amazon.com/waf/latest/APIReference/API_CreateWebACL.html
    "waf_xss_match_set"                   = "128" #	https://docs.aws.amazon.com/waf/latest/APIReference/API_CreateXssMatchSet.html
    "wafregional_byte_match_set"          = "128" #	https://docs.aws.amazon.com/waf/latest/APIReference/API_regional_CreateByteMatchSet.html
    "wafregional_geo_match_set"           = "128" #	https://docs.aws.amazon.com/waf/latest/APIReference/API_regional_CreateGeoMatchSet.html
    "wafregional_ipset"                   = "128" #	https://docs.aws.amazon.com/waf/latest/APIReference/API_regional_CreateIPSet.html
    "wafregional_rate_based_rule"         = "128" #	https://docs.aws.amazon.com/waf/latest/APIReference/API_regional_CreateRateBasedRule.html
    "wafregional_regex_match_set"         = "128" #	https://docs.aws.amazon.com/waf/latest/APIReference/API_regional_CreateRegexMatchSet.html
    "wafregional_regex_pattern_set"       = "128" #	https://docs.aws.amazon.com/waf/latest/APIReference/API_regional_CreateRegexPatternSet.html
    "wafregional_rule"                    = "128" #	https://docs.aws.amazon.com/waf/latest/APIReference/API_regional_CreateRule.html
    "wafregional_rule_group"              = "128" #	https://docs.aws.amazon.com/waf/latest/APIReference/API_regional_CreateRuleGroup.html
    "wafregional_size_constraint_set"     = "128" #	https://docs.aws.amazon.com/waf/latest/APIReference/API_regional_CreateSizeConstraintSet.html
    "wafregional_sql_injection_match_set" = "128" #	https://docs.aws.amazon.com/waf/latest/APIReference/API_regional_CreateSqlInjectionMatchSet.html
    "wafregional_web_acl"                 = "128" #	https://docs.aws.amazon.com/waf/latest/APIReference/API_regional_CreateWebACL.html
    "wafregional_xss_match_set"           = "128" #	https://docs.aws.amazon.com/waf/latest/APIReference/API_regional_CreateXssMatchSet.html
  }
}
