const { join } = require("path");
const { existsSync, mkdirSync, copyFileSync, cpSync } = require("fs");
const { execSync } = require("child_process");
const { Logger } = require("./logger");
require("dotenv").config();

const archive2Exe = join(
  __dirname,
  "../tools/Quick Configuration v1.12.7/Archive2/Archive2.exe",
);
if (!existsSync(archive2Exe)) {
  throw new Error(
    `The Archive2 executable was not found at '${archive2Exe}'. Please download & extract the full contents from https://www.nexusmods.com/fallout76/mods/546?tab=files&file_id=13110.`,
  );
}

const ffdecBat = join(__dirname, "../tools/ffdec_20.1.0/ffdec.bat");
if (!existsSync(ffdecBat)) {
  throw new Error(
    `The ffdec executable was not found at '${ffdecBat}'. Please download & extract the 'ZIP (Windows, Linux, Mac OS)' version from https://github.com/jindrapetrik/jpexs-decompiler/releases/tag/version20.1.0`,
  );
}

const distPath = join(__dirname, "../dist");
const baseHudmenuSwf = join(__dirname, "../src/base_hudmenu.swf");
const srcNoStealthMeterSwf = join(
  __dirname,
  "../src/Data/interface/no_stealth_meter.swf",
);
const distNoStealthMeterSwf = join(
  __dirname,
  "../dist/Data/interface/no_stealth_meter.swf",
);
const distInterfaceDir = join(distPath, "Data/interface");
const distDataDir = join(distPath, "Data/interface");
const sourceDataDir = join(__dirname, "../src/Data/interface");
const hudmenuSwf = join(distInterfaceDir, "hudmenu.swf");
const scripts = join(__dirname, "../src/scripts");
const noStealthClass = join(__dirname, "../src/scripts/NoStealthMeter.as");
const ba2Name = process.env.NO_STEALTH_METER_BA2;

mkdirSync(distInterfaceDir, { recursive: true });

/**
 * WARNING: this command does NOT import new scripts. Instead, use the JPEXS GUI to add a new class, and then any new
 * changes will be detected.
 * @type {string}
 */
execSync(
  `"${ffdecBat}" -importScript "${baseHudmenuSwf}" "${hudmenuSwf}" ${scripts} `,
);
execSync(
  `"${ffdecBat}" -importScript "${srcNoStealthMeterSwf}" "${distNoStealthMeterSwf}" ${scripts} `,
);

// cpSync(sourceDataDir, distDataDir, { recursive: true });

const ba2ArchiveCommand = `"${archive2Exe}" "${distDataDir}" -create="dist/${ba2Name}"`;
Logger.info(
  `Compressing ${distDataDir} to dist/${ba2Name}: ${ba2ArchiveCommand}`,
);
execSync(ba2ArchiveCommand);
