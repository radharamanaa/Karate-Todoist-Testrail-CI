package examples.hooks;


import com.intuit.karate.KarateOptions;
import com.intuit.karate.junit4.Karate;
import org.junit.BeforeClass;
import org.junit.runner.RunWith;

@RunWith(Karate.class)
@KarateOptions(features = "classpath:demo/hooks/AfterScenario.feature")
public class AfterScenario {
    @BeforeClass
    public static void beforeClass() {
        // skip 'callSingle' in karate-config.js
        System.setProperty("karate.env", "mock");
    }
}
