package titans.api.test.runner;

import com.intuit.karate.junit5.Karate;

public class TestRunner {

	@Karate.Test
	public Karate runTest() {
		//classpath is the location to your feature files. 
		// if this path is wrong you won't be able to run anything. 
		// tag is to specify with tag to execute with this runner
		return Karate.run("classpath:features")
				.tags("negative");
	}
}

// J unit is a test engine that will work with test annotation, 
//  the main using case is unit testing. 
// But as UI tester we use it for structuring our framework as well.