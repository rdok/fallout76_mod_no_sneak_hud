class Logger {
  static info(...input) {
    if (!process.env.LOGGING) return;
    console.log(...input);
  }
}

module.exports = { Logger };
