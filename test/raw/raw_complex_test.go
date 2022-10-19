package test

import (
	"testing"

	"github.com/stretchr/testify/assert"

	"github.com/gruntwork-io/terratest/modules/terraform"
)

func TestTerraformStringCaseRawComplex(t *testing.T) {
	// t.Parallel()

	expectedRaw := "The 2 quick, brown, and smart fox jumped over the MacDonald's fence."
	expectedAlphaNum := "The2quickbrownandsmartfoxjumpedovertheMacDonaldsfence"
	expectedCamel := "the2QuickBrownAndSmartFoxJumpedOverTheMacDonaldSFence"
	expectedEnvVar := "THE_2_QUICK_BROWN_AND_SMART_FOX_JUMPED_OVER_THE_MACDONALDS_FENCE"
	expectedKebab := "the-2-quick-brown-and-smart-fox-jumped-over-the-macdonalds-fence"
	expectedLower := "the 2 quick, brown, and smart fox jumped over the macdonald's fence."
	expectedPascal := "The2QuickBrownAndSmartFoxJumpedOverTheMacDonaldSFence"
	expectedSnake := "the_2_quick_brown_and_smart_fox_jumped_over_the_macdonalds_fence"
	expectedTitle := "The 2 Quick, Brown, And Smart Fox Jumped Over The MacDonald'S Fence."
	expectedUpper := "THE 2 QUICK, BROWN, AND SMART FOX JUMPED OVER THE MACDONALD'S FENCE."

	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		TerraformDir: "../../examples/raw",
		Vars: map[string]interface{}{
			"raw": expectedRaw,
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
