package pages;

import java.time.Duration;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

public class HomePage {
	WebDriver driver;

	static final String URL = "https://useinsider.com/";
	static final String TITLE = "#1 Leader in Individualized, Cross-Channel CX — Insider";
	static final String ERRORPREFIX = "HomePage - ";

	By acceptCookies = By.linkText("Accept All");
	By company = By.linkText("Company");
	By careers = By.linkText("Careers");

	public HomePage(WebDriver driver) {
		this.driver = driver;
	}

	public void loadPage() {
		driver.get(URL);
		WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(20));
		try {
			wait.until(ExpectedConditions.elementToBeClickable(acceptCookies)).click();
		} catch (Exception e) {
			System.out.println("Timeout for cookies popup !");
		}
	}

	public void verifyUrl() {
		String url = driver.getCurrentUrl();
		if (!URL.equals(url)) {
			throw new RuntimeException(ERRORPREFIX + "URL is incorrect (Expected: " + URL + ", Actual: " + url + ")");
		}
	}

	public void verifyTitle() {
		String title = driver.getTitle();
		if (!TITLE.equals(title)) {
			throw new RuntimeException(
					ERRORPREFIX + "Title is incorrect (Expected: " + TITLE + ", Actual: " + title + ")");
		}
	}

	public void clickCompany() {
		driver.findElement(company).click();
	}

	public void clickCareers() {
		WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(20));
		wait.until(ExpectedConditions.elementToBeClickable(careers)).click();
	}
}
