#!/usr/bin/env node

import { spawn } from 'child_process';
import { promises as fs } from 'fs';
import path from 'path';
import { fileURLToPath } from 'url';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);
const projectRoot = path.resolve(__dirname, '..');

// Configuration for each language generator
const generators = [
  {
    name: 'TypeScript',
    generator: 'typescript-fetch',
    outputDir: 'generated/typescript',
    additionalProperties: [
      'npmName=@samhandling/client',
      'npmVersion=1.0.0',
      'supportsES6=true',
      'typescriptThreePlus=true'
    ],
    configFile: 'typescript-config.json'
  },
  {
    name: 'Java',
    generator: 'java',
    outputDir: 'generated/java',
    additionalProperties: [
      'library=native',
      'artifactId=samhandling-client',
      'groupId=no.samhandling',
      'artifactVersion=1.0.0',
      'packageName=no.samhandling.client'
    ],
    configFile: 'java-config.json'
  },
  {
    name: 'C#',
    generator: 'csharp',
    outputDir: 'generated/csharp',
    additionalProperties: [
      'packageName=Samhandling.Client',
      'packageVersion=1.0.0',
      'clientPackage=Samhandling.Client',
      'packageCompany=Samhandling',
      'packageAuthors=Samhandling',
      'packageDescription=Generated-client-for-Samhandling-API',
      'targetFramework=net8.0',
      'nullableReferenceTypes=true'
    ],
    configFile: 'csharp-config.json'
  }
];

async function cleanGeneratedDirectories() {
  console.log('🧹 Cleaning previous generated clients...');
  
  for (const generator of generators) {
    const outputPath = path.join(projectRoot, generator.outputDir);
    try {
      await fs.rm(outputPath, { recursive: true, force: true });
      console.log(`   ✓ Cleaned ${generator.outputDir}`);
    } catch (error) {
      // Directory might not exist, that's fine
      console.log(`   ✓ ${generator.outputDir} (already clean)`);
    }
  }
}

async function checkOpenAPISpec() {
  const specPath = path.join(projectRoot, 'tsp-output/@typespec/openapi3/openapi.yaml');
  
  try {
    await fs.access(specPath);
    console.log(`✓ Found OpenAPI spec at: ${specPath}`);
    return specPath;
  } catch (error) {
    console.error('❌ OpenAPI spec not found. Please run `npm run compile:tsp` first.');
    console.error(`   Expected: ${specPath}`);
    process.exit(1);
  }
}

function runGenerator(generator, specPath) {
  return new Promise((resolve, reject) => {
    console.log(`\n🔄 Generating ${generator.name} client...`);
    
    const outputPath = path.join(projectRoot, generator.outputDir);
    const configPath = path.join(__dirname, generator.configFile);
    
    // Build the command arguments
    const args = [
      'generate',
      '-g', generator.generator,
      '-i', specPath,
      '-o', outputPath,
      '--additional-properties', generator.additionalProperties.join(',')
    ];
    
    // Add config file if it exists
    try {
      require('fs').accessSync(configPath);
      args.push('-c', configPath);
      console.log(`   Using config: ${generator.configFile}`);
    } catch {
      // Config file doesn't exist, that's fine
    }
    
    console.log(`   Command: openapi-generator-cli ${args.join(' ')}`);
    
    const child = spawn('npx', ['openapi-generator-cli', ...args], {
      cwd: projectRoot,
      stdio: 'inherit'
    });
    
    child.on('close', (code) => {
      if (code === 0) {
        console.log(`   ✅ ${generator.name} client generated successfully`);
        resolve();
      } else {
        console.error(`   ❌ ${generator.name} client generation failed with exit code ${code}`);
        reject(new Error(`${generator.name} generation failed`));
      }
    });
    
    child.on('error', (error) => {
      console.error(`   ❌ Failed to start ${generator.name} generator:`, error.message);
      reject(error);
    });
  });
}

async function generateAllClients() {
  console.log('🚀 Starting client library generation...\n');
  
  // Clean previous builds
  await cleanGeneratedDirectories();
  
  // Check if OpenAPI spec exists
  const specPath = await checkOpenAPISpec();
  
  // Generate clients for each language
  let hasErrors = false;
  
  for (const generator of generators) {
    try {
      await runGenerator(generator, specPath);
    } catch (error) {
      hasErrors = true;
      console.error(`Failed to generate ${generator.name} client:`, error.message);
    }
  }
  
  if (hasErrors) {
    console.error('\n❌ Some client generations failed. See errors above.');
    process.exit(1);
  } else {
    console.log('\n✅ All client libraries generated successfully!');
    console.log('\nGenerated clients:');
    for (const generator of generators) {
      console.log(`   📁 ${generator.outputDir}/ - ${generator.name}`);
    }
  }
}

// Run the main function
generateAllClients().catch((error) => {
  console.error('❌ Client generation failed:', error.message);
  process.exit(1);
});
