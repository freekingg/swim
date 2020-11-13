import puppeteer from 'puppeteer';
import { config } from 'lin-mizar';

const createPoster = async (id) => {
  const browser = await puppeteer.launch({ headless: false });
  const page = await browser.newPage();
  await page.goto(`http://localhost:8081/static/template/?id=${id}`);
  await page.screenshot({ path: `./app/assets/poster/${id}.png`, fullPage: true });
  await browser.close();
  return `poster/${id}.png`;
};
export { createPoster };