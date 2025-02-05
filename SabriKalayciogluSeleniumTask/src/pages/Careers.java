package pages;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;

public class Careers {
	WebDriver driver;

	static final String TITLE = "Ready to disrupt? | Insider Careers";
	static final String ERRORPREFIX = "Careers - ";

	public Careers(WebDriver driver) {
		this.driver = driver;
	}

	By teamsHeader = By.xpath("//h3[contains(text(),'Find your calling')]");
	By teamsBlock = By.xpath("//*[@class='col-12 d-flex flex-wrap p-0 career-load-more']");
	By locationsHeader = By.xpath("//h3[contains(text(),'Our Locations')]");
	By locationsBlock = By.id("location-slider");
	By lifeHeader = By.xpath("//h2[contains(text(),'Life at Insider')]");
	By lifeBlockText = By.xpath("//*[@class='elementor-element elementor-element-fe38935 elementor-widget elementor-widget-text-editor']");
	By lifeBlockCarousel = By.xpath("//*[@class='elementor-element elementor-element-c06d1ec elementor-skin-carousel elementor-widget elementor-widget-media-carousel e-widget-swiper']");

	public void verifyTitle() {
		String title = driver.getTitle();
		if (!TITLE.equals(title)) {
			throw new RuntimeException(ERRORPREFIX + "Title is incorrect (Expected: " + TITLE + ", Actual: " + title + ")");
		}
	}

	public void verifyTeamsHeaderDisplayed() {
		if (!driver.findElement(teamsHeader).isDisplayed()) {
			throw new RuntimeException(ERRORPREFIX + "Teams header is not visible");
		}
	}

	public void verifyTeamsBlockDisplayed() {
		if (!driver.findElement(teamsBlock).isDisplayed()) {
			throw new RuntimeException(ERRORPREFIX + "Teams block is not visible");
		}
	}

	public void verifyLocationsHeaderDisplayed() {
		if (!driver.findElement(locationsHeader).isDisplayed()) {
			throw new RuntimeException(ERRORPREFIX + "Locations header is not visible");
		}
	}

	public void verifyLocationsBlockDisplayed() {
		if (!driver.findElement(locationsBlock).isDisplayed()) {
			throw new RuntimeException(ERRORPREFIX + "Locations block is not visible");
		}
	}

	public void verifyLifeHeaderDisplayed() {
		if (!driver.findElement(lifeHeader).isDisplayed()) {
			throw new RuntimeException(ERRORPREFIX + "Life header is not visible");
		}
	}

	public void verifyLifeBlockDisplayed() {
		if (!driver.findElement(lifeBlockText).isDisplayed()) {
			throw new RuntimeException(ERRORPREFIX + "Life block is not visible");
		}
	}
}