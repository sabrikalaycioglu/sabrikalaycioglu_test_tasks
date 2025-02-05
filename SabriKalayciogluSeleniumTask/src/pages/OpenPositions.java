package pages;

import java.time.Duration;
import java.util.List;

import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.interactions.Actions;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

public class OpenPositions {
	WebDriver driver;

	static final String QAURL = "https://useinsider.com/careers/quality-assurance/";
	static final String TITLE = "Insider quality assurance job opportunities";
	static final String ERRORPREFIX = "OpenPositions - ";

	public OpenPositions(WebDriver driver) {
		this.driver = driver;
	}

	By qaJobs = By.linkText("See all QA jobs");
	By locations = By.id("select2-filter-by-location-container");
	By linkToIstanbul = By.xpath("//li[contains(@id,'Istanbul, Turkey')]");
	By department = By.id("select2-filter-by-department-container");
	By totalResult = By.xpath("//span[@id='deneme' and @class='totalResult']");
	By jobList = By.xpath("//div[@id='jobs-list']/div");
	By positionTitle = By.xpath(".//p[contains(@class,'position-title')]");
	By positionDepartment = By.xpath(".//span[contains(@class,'position-department')]");
	By positionLocation = By.xpath(".//div[contains(@class,'position-location')]");
	By nextButton = By.xpath("//button[@class='btn btn-yellow rounded has-icon page-button next pr-4']");
	By firstJob = By.xpath("//div[@id='jobs-list']/div[1]");
	By viewRole = By.linkText("View Role");
	By pagination = By.id("pagination");

	public void loadPage() {
		driver.get(QAURL);
	}

	public void verifyTitle() {
		String title = driver.getTitle();
		if (!TITLE.equals(title)) {
			throw new RuntimeException(
					ERRORPREFIX + "Title is incorrect (Expected: " + TITLE + ", Actual: " + title + ")");
		}
	}

	public void clickQaJobs() {
		driver.findElement(qaJobs).click();
	}

	public void verifyDepartment(String expectedDepartment) {

		WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(30));
		try {
			wait.until(ExpectedConditions.textToBePresentInElementLocated(department, expectedDepartment));
		} catch (Exception e) {
			throw new RuntimeException(
					ERRORPREFIX + "Timeout for department ! " + expectedDepartment + " is not selected");
		}
	}

	public void filterByLocation() throws InterruptedException {
		Thread.sleep(1000); // just to make the run easier to follow, otherwise not needed
		driver.findElement(locations).click();

		WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(20));
		try {
			wait.until(ExpectedConditions.elementToBeClickable(linkToIstanbul));
		} catch (Exception e) {
			throw new RuntimeException(ERRORPREFIX + "Timeout for Istanbul, Turkey option ! Option is not available");
		}

		WebElement link = driver.findElement(linkToIstanbul);

		// Bring web element to viewport
		JavascriptExecutor js = (JavascriptExecutor) driver;
		js.executeScript("arguments[0].scrollIntoView({ block: 'start' });", link);
		Thread.sleep(1000); // just to make the run easier to follow, otherwise not needed
		link.click();
	}

	private int getTotalResult() {
		return Integer.parseInt(driver.findElement(totalResult).getText());
	}

	private List<WebElement> getJobList() {
		return driver.findElements(jobList);
	}

	private String getPositionTitle(WebElement job) {
		return job.findElement(positionTitle).getText();
	}

	private String getPositionDepartment(WebElement job) {
		return job.findElement(positionDepartment).getText();
	}

	private String getPositionLocation(WebElement job) {
		return job.findElement(positionLocation).getText();
	}

	private boolean nextButtonEnabled() {
		return driver.findElement(nextButton).isEnabled();
	}

	public void moveToFirstJob() throws InterruptedException {
		WebElement element = driver.findElement(firstJob);

		// Bring web element to viewport
		JavascriptExecutor js = (JavascriptExecutor) driver;
		js.executeScript("arguments[0].scrollIntoView({ block: 'center' });", element);

		// Hover over the web element
		new Actions(driver).moveToElement(element).perform();
	}

	public void clickViewRole() {
		WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(20));
		try {
			wait.until(ExpectedConditions.elementToBeClickable(viewRole)).click();
		} catch (Exception e) {
			throw new RuntimeException(ERRORPREFIX + "Timeout for View Role button !");
		}
	}

	public int verifyJobList(String expectedLocation, String expectedDepartment, String expectedTitleLong,
			String expectedTitleShort) throws InterruptedException {
		int totalJobs = getTotalResult();
		int verifiedJobCount = 0;

		// Go over all the listed jobs IN ALL PAGES !!!
		// Perform additional checks regarding the consistency of job count, total job
		// count as it appears on the screen and the status of Next button
		// IMPORTANT: Discrepancies are reported as warnings for the sake of completing the task till the end

		while (verifiedJobCount < totalJobs) {
			Thread.sleep(5000);
			List<WebElement> jobList = getJobList();
			if (jobList.size() == 0) {
				System.out.println("WARNING: More jobs is expected based on verified jobs (" + verifiedJobCount
						+ ") and totalResult (" + totalJobs + ")");
				break;
			}
			for (WebElement job : jobList) {
				String title = getPositionTitle(job);
				if (!title.contains(expectedTitleLong) && !title.contains(expectedTitleShort)) {
					throw new RuntimeException(ERRORPREFIX + "Job Title is incorrect (Expected: " + expectedTitleLong
							+ " or " + expectedTitleShort + ", Actual: " + title + ")");
				}
				String department = getPositionDepartment(job);
				if (!department.equals(expectedDepartment)) {
					throw new RuntimeException(ERRORPREFIX + "Department is incorrect (Expected: " + expectedDepartment
							+ ", Actual: " + department + ")");
				}
				String location = getPositionLocation(job);
				if (!location.equals(expectedLocation)) {
					throw new RuntimeException(ERRORPREFIX + "Location is incorrect (Expected: " + expectedLocation
							+ ", Actual: " + location + ")");
				}
				verifiedJobCount++;
			}
			boolean nextButtonEnabled = nextButtonEnabled();
			if (nextButtonEnabled && verifiedJobCount >= totalJobs) {
				System.out.println("WARNING: Next button is expected to be disabled based on verified jobs ("
						+ verifiedJobCount + ") and totalResult (" + totalJobs + ")");
				break;
			}
			if (!nextButtonEnabled && verifiedJobCount < totalJobs) {
				System.out.println("WARNING: Next button is expected to be enabled based on verified jobs ("
						+ verifiedJobCount + ") and totalResult (" + totalJobs + ")");
				break;
			}
			// Now it is ok to click Next
			if (nextButtonEnabled) {

				WebElement page = driver.findElement(pagination);

				// Bring web element to viewport and click
				JavascriptExecutor js = (JavascriptExecutor) driver;
				js.executeScript("arguments[0].scrollIntoView({ block: 'center' });", page);

				Thread.sleep(1000); // just to make the run easier to follow, otherwise not needed

				WebElement next = driver.findElement(nextButton);

				js = (JavascriptExecutor) driver;
				js.executeScript("arguments[0].click();", next);
			}
		}
		return verifiedJobCount;
	}
}