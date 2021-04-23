package test

import (
	"fmt"
	"log"
	"os"
	"testing"

	"github.com/gruntwork-io/terratest/modules/aws"
	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

// An example of how to test the Terraform module in examples/terraform-aws-sagemaker-example using Terratest.
func TestTerraformLambdaExample(t *testing.T) {
	t.Parallel()

	targetRegions := []string{"us-east-1"}

	awsRegion := aws.GetRandomStableRegion(t, nil, nil)
	dir, err := os.Getwd()
	if err != nil {
		log.Fatal(err)
	}
	fmt.Println(dir)
	terraformOptions := &terraform.Options{
		// The path to where our Terraform code is located
		TerraformDir: "../examples",
		// Variables to pass to our Terraform code using -var options
		VarFiles: []string{"../env-config/dev.tfvars"},
		NoColor:  false,

		// Environment variables to set when running Terraform
		EnvVars: map[string]string{
			"AWS_DEFAULT_REGION": awsRegion,
		},
	}

	planOut := terraform.InitAndPlan(t, terraformOptions)

	assert.Contains(t, planOut, "module.api_gw.data.template_file.this will be read during apply")
	assert.Contains(t, planOut, "module.api_gw.aws_api_gateway_deployment.this will be created")
	assert.Contains(t, planOut, "module.api_gw.aws_api_gateway_integration.lambda will be created")
	assert.Contains(t, planOut, "module.api_gw.aws_api_gateway_integration.lambda_root will be created")
	assert.Contains(t, planOut, "module.api_gw.aws_api_gateway_method.proxy will be created")
	assert.Contains(t, planOut, "module.api_gw.aws_api_gateway_method.proxy_root will be created")
	assert.Contains(t, planOut, "module.api_gw.aws_api_gateway_resource.proxy will be created")
	assert.Contains(t, planOut, "module.api_gw.aws_api_gateway_resource.this will be created")
	assert.Contains(t, planOut, "module.api_gw.aws_api_gateway_rest_api.this will be created")
	assert.Contains(t, planOut, "module.api_gw.aws_api_gateway_stage.this will be created")
	assert.Contains(t, planOut, "module.api_gw.aws_cloudwatch_event_rule.this will be created")
	assert.Contains(t, planOut, "module.api_gw.aws_lambda_function.this will be created")
	assert.Contains(t, planOut, "module.api_gw.aws_lambda_permission.this will be created")
	assert.Contains(t, planOut, "Plan: 12 to add, 0 to change, 0 to destroy.")
}
