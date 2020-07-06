import {AppPage} from './app.po';
import {screenshot} from '../screenshot';

describe('screenshot scenes for each component', () => {
  // These tests simply serve as a convenient way to take snapshots of different pages,
  // they are not actually testing anything
  let page: AppPage;

  const components = [
    'autocomplete',
    'badge',
    'bottom-sheet',
    'button',
    'button-toggle',
    'card',
    'checkbox',
    'chips',
    'datepicker',
    'dialog',
    'divider',
    'expansion',
    'form-field',
    'grid-list',
    'input',
    'list',
    'menu',
    'paginator',
    'progress-bar',
    'progress-spinner',
    'radio',
    'ripple',
    'select',
    'slide-toggle',
    'slider',
    'stepper',
    'snack-bar',
    'toolbar',
    'tooltip',
    'tree',
  ];

  beforeEach(() => {
    page = new AppPage();
  });

  for (const comp of components) {
    it(`screenshot for ${comp} scene`, async () => {
      await page.navigateTo(comp);
      await screenshot(comp);
    });
  }
});
