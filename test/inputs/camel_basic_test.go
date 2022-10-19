package test

import (
	"testing"

	"github.com/stretchr/testify/assert"

	"github.com/gruntwork-io/terratest/modules/terraform"
)

func TestTerraformStringCaseCamelBasic(t *testing.T) {
	t.Parallel()

	expectedRaw := "The2 Quick Brown Fox Jumped Over The Fence"
	expectedAlphaNum := "The2QuickBrownFoxJumpedOverTheFence"
	expectedCamel := "the2QuickBrownFoxJumpedOverTheFence"
	expectedEnvVar := "THE2_QUICK_BROWN_FOX_JUMPED_OVER_THE_FENCE"
	expectedKebab := "the2-quick-brown-fox-jumped-over-the-fence"
	expectedLower := "the2 quick brown fox jumped over the fence"
	expectedPascal := "The2QuickBrownFoxJumpedOverTheFence"
	expectedSnake := "the2_quick_brown_fox_jumped_over_the_fence"
	expectedTitle := "The2 Quick Brown Fox Jumped Over The Fence"
	expectedUpper := "THE2 QUICK BROWN FOX JUMPED OVER THE FENCE"

	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		TerraformDir: "../../examples/camel",
		Vars: map[string]interface{}{
			"camel": expectedCamel,
		},
		NoColor: true,
	})

	defer terraform.Destroy(t, terraformOptions)
	terraform.InitAndApply(t, terraformOptions)

	// Run `terraform output` to get the values of output variables
	actualRaw := terraform.Output(t, terraformOptions, "raw")
	actualAlphaNum := terraform.Output(t, terraformOptions, "alpha_num")
	actualCamel := terraform.Output(t, terraformOptions, "camel")
	actualEnvVar := terraform.Output(t, terraformOptions, "env_var")
	actualKebab := terraform.Output(t, terraformOptions, "kebab")
	actualLower := terraform.Output(t, terraformOptions, "lower")
	actualPascal := terraform.Output(t, terraformOptions, "pascal")
	actualSnake := terraform.Output(t, terraformOptions, "snake")
	actualTitle := terraform.Output(t, terraformOptions, "title")
	actualUpper := terraform.Output(t, terraformOptions, "upper")

	// Verify we're getting back the outputs we expect
	assert.Equal(t, expectedRaw, actualRaw)
	assert.Equal(t, expectedAlphaNum, actualAlphaNum)
	assert.Equal(t, expectedCamel, actualCamel)
	assert.Equal(t, expectedEnvVar, actualEnvVar)
	assert.Equal(t, expectedKebab, actualKebab)
	assert.Equal(t, expectedLower, actualLower)
	assert.Equal(t, expectedPascal, actualPascal)
	assert.Equal(t, expectedSnake, actualSnake)
	assert.Equal(t, expectedTitle, actualTitle)
	assert.Equal(t, expectedUpper, actualUpper)
}
