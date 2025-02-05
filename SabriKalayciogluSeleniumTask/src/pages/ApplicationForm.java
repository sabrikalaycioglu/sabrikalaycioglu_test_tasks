package pages;

import org.openqa.selenium.WebDriver;

public class ApplicationForm {
	WebDriver driver;

	static final String TITLE = "Insider Open Positions | Insider";
	static final String ERRORPREFIX = "ApplicationForm - ";

	public ApplicationForm(WebDriver driver) {
		this.driver = driver;
	}

	public void verifyTitle() {
		String title = driver.getTitle();
		if (!TITLE.equals(title)) {
			throw new RuntimeException(
					ERRORPREFIX + "Title is incorrect (Expected: " + TITLE + ", Actual: " + title + ")");
		}
	}
}