package runner;

import io.cucumber.testng.AbstractTestNGCucumberTests;
import io.cucumber.testng.CucumberOptions;

@CucumberOptions(
        tags = "",
        features = "src/test/resources/features",
        glue = "StepDefinitions",
        plugin = {}
)
public class TestRunner extends AbstractTestNGCucumberTests {
}
