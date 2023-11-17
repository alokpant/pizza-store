const path = require('path');

module.exports = {
  testMatch: ['**/?(*.)+(spec|test).(j|t)s?(x)'],
  rootDir: path.resolve(__dirname, './'),
  moduleDirectories: ['node_modules'],
  moduleFileExtensions: ['js', 'jsx', 'ts', 'tsx', 'd.ts', 'css'],
  setupFilesAfterEnv: ["<rootDir>/jest.setup.js"],
  automock: false,
  roots: ['./src'],
  testEnvironment: 'jsdom',
};
