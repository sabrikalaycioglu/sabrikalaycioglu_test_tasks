package testcases;

import org.openqa.selenium.OutputType;
import org.openqa.selenium.TakesScreenshot;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.openqa.selenium.firefox.FirefoxDriver;

import java.util.Scanner;
import java.io.File;
import org.apache.commons.io.FileUtils;

import pages.*;

/**
 * Implements the Selenium task given by Insider
 * <p>
 * Test case verifies the following user journey:
 * <p>
 * > Visit https://useinsider.com/ and check Insider home page is opened or not
 * <p>
 * > Select the “Company” menu in the navigation bar, select “Careers” and check
 * Career page, its Locations, Teams, and Life at Insider blocks are open or not
 * <p>
 * > Go to https://useinsider.com/careers/quality-assurance/, click “See all QA
 * jobs”, filter jobs by Location: “Istanbul, Turkey”, and Department: “Quality
 * Assurance”, check the presence of the job list
 * <p>
 * > Check that all jobs’ Position contains “Quality Assurance”, Department
 * contains “Quality Assurance”, and Location contains “Istanbul, Turkey”
 * <p>
 * > Click the “View Role” button and check that this action redirects us to the
 * Lever Application form page
 * <p>
 * Chrome Version : 132.0.6834.160 Firefox Version: 134.0.2
 * 
 * @author kalaycioglus
 *
 */
public class UseInsiderTestCase {

	public static void main(String[] args) {

		WebDriver driver = null;

		// Get browser type from user
		// [c] for Chrome
		// [f] for Firefox
		Scanner scanner = new Scanner(System.in);
		System.out.print("Enter browser to be used for testing ... [c]hrome, [f]irefox: ");
		char browser = scanner.next().charAt(0);
		scanner.close();
		if (browser == 'c') {
			ChromeOptions options = new ChromeOptions();
			options.addArguments("--disable-cookies");
			System.setProperty("webdriver.chrome.driver", "resources/drivers/chromedriver.exe");
			driver = new ChromeDriver();
		} else if (browser == 'f') {
			System.setProperty("webdriver.gecko.driver", "resources/drivers/geckodriver.exe");
			driver = new FirefoxDriver();
		} else {
			System.out.println("Wrong input... exiting");
			System.exit(-1);
		}

		// remove screenshot from previous run if there is any
		removeScreenshot();

		try {
			HomePage homePage = new HomePage(driver);
			Careers careers = new Careers(driver);
			OpenPositions openPositions = new OpenPositions(driver);
			ApplicationForm applicationForm = new ApplicationForm(driver);

			driver.manage().window().maximize();

			// Homepage

			// Load page
			homePage.loadPage();
			logSuccess("Homepage - load page");
			// Verify page URL
			homePage.verifyUrl();
			logSuccess("Homepage - verify URL");
			// Verify page title
			homePage.verifyTitle();
			logSuccess("Homepage - verify title");
			// Move on to Careers
			homePage.clickCompany();
			logSuccess("Homepage - click Company");
			Thread.sleep(1000); // just to make the run easier to follow, otherwise not needed
			homePage.clickCareers();
			logSuccess("Homepage - click Careers");

			// Careers

			// Verify page title
			careers.verifyTitle();
			logSuccess("Careers - verify title");
			// Verify teams
			careers.verifyTeamsHeaderDisplayed();
			logSuccess("Careers - verify Teams header");
			careers.verifyTeamsBlockDisplayed();
			logSuccess("Careers - verify Teams block");
			// Verify locations
			careers.verifyLocationsHeaderDisplayed();
			logSuccess("Careers - verify Teams header");
			careers.verifyLocationsBlockDisplayed();
			logSuccess("Careers - verify Teams block");
			// Verify life at insider
			careers.verifyLifeHeaderDisplayed();
			logSuccess("Careers - verify Teams header");
			careers.verifyLifeBlockDisplayed();
			logSuccess("Careers - verify Teams block");

			// OpenPositions

			// Load page
			openPositions.loadPage();
			logSuccess("OpenPositions - load page");
			// Verify page title
			openPositions.verifyTitle();
			logSuccess("OpenPositions - verify title");
			// Move on to QA Jobs
			openPositions.clickQaJobs();
			logSuccess("OpenPositions - click QA Jobs");
			String expectedLocation = "Istanbul, Turkey";
			String expectedDepartment = "Quality Assurance";
			String expectedTitleLong = "Quality Assurance";
			String expectedTitleShort = "QA";
			// Verify selected department is equal to expected department
			openPositions.verifyDepartment(expectedDepartment);
			logSuccess("OpenPositions - verify department");
			// Filter jobs by location
			openPositions.filterByLocation();
			logSuccess("OpenPositions - filter by location");
			// Verify job list using pagination
			int verifiedJobCount = openPositions.verifyJobList(expectedLocation, expectedDepartment, expectedTitleLong,
					expectedTitleShort);
			logSuccess("OpenPositions - verify listed jobs (" + verifiedJobCount + " jobs)");
			// Make sure there is at least one job listed before attempting to click View
			// Role
			if (verifiedJobCount > 0) {
				openPositions.moveToFirstJob();
				logSuccess("OpenPositions - move to first job");
				openPositions.clickViewRole();
				logSuccess("OpenPositions - click View Role");
				Thread.sleep(5000); // just to make the run easier to follow, otherwise not needed
				// Verify page title
				applicationForm.verifyTitle();
				logSuccess("Application Form - verify title");
			}

			driver.quit();
			System.out.println("Test PASSED... exiting");
		} catch (Exception e) {
			System.out.println("ERROR: " + e.getMessage());
			// Take screenshot
			takeScreenshot(driver);
			driver.quit();
			System.out.println("Test FAILED... exiting");
			System.exit(-1);
		}
	}

	// Method to remove screenshot from previous run in project directory
	private static void removeScreenshot() {
		try {
			new File("screenshot.jpeg").delete();
		} catch (Exception e) {
			System.out.println("ERROR: " + e.getMessage());
		}
	}

	// Method to take screenshot and copy to project directory
	private static void takeScreenshot(WebDriver driver) {
		try {
			File File = ((TakesScreenshot) driver).getScreenshotAs(OutputType.FILE);
			FileUtils.copyFile(File, new File("screenshot.jpeg"));
		} catch (Exception e) {
			System.out.println("ERROR: " + e.getMessage());
		}
	}

	// Method to log success message
	private static void logSuccess(String msg) {
		System.out.println("TEST STEP: " + msg + " ... OK");
	}
}