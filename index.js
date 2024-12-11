import express from 'express';
import puppeteer from 'puppeteer';
import * as fs from 'fs';
import Handlebars from "handlebars";

const app = express();

async function htmlToPDF(htmlObject) {
    const browser = await puppeteer.launch();
    const page = await browser.newPage();
    await page.setViewport({ width: 1920, height: 1080 });
    await page.setContent(htmlObject);
    await page.emulateMediaType('screen');
    await page.pdf({
      path: 'render.pdf',
      printBackground: true,
      format: 'A4',
      margin: { top: '50px', bottom: '50px' },
    });
    await browser.close();
}

const PORT = process.env.PORT || 3000;
app.get('/', (req, res) => {
  const jsonData = JSON.parse(fs.readFileSync('sample.json'));
  jsonData.date = new Date().toLocaleDateString("hi-IN");
  const tmplFilePath = 'invoice.tpl';
  const tmplContent = fs.readFileSync(tmplFilePath, 'utf8');
  const template = Handlebars.compile(tmplContent);
  const renderedHtml = template(jsonData);
  htmlToPDF(renderedHtml);
  fs.writeFileSync(`${Date.now().toString()}_invoice.html`, renderedHtml);
  res.send('Hello World!');
});
  
app.listen(PORT, () => {
    return console.log(`Express is listening at http://localhost:${PORT}`);
});