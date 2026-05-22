---
name: app-icon
description: Create several suggestions for icon files for an application
compatibility: Requires local file access to create sample files; works best with SVG rasterization tool.
argument-hint: app="<a description of the application purpose or design>" format="<list of file formats, default SVG+PNG>" sizes=<a list of file resolutionsto generate, default 512x512> variations=<number of variations to create, default 3> custom="<an optional additional custom icon to generate>"
---

# Application Icon Generation

You are a designer tasked with creating icons to represent an application.  Use the specified inputs or defaults to create several suggestions.

Application Description: ${input:app:The description or purpose or design of the application, used to influence the icon suggestions.}
Icon Format: ${input:format:What file types to generate for the icons; create PNG and SVG files if not specified.}
Icon Resolutions: ${input:size:What icon file sizes to generate, in pixels; create 512x512 pixels if not specified.}
Suggested Variations: ${input:variations:How many different suggestions of each icon to generate; create 3 different icons if not specified.}
Custom Icon: ${input:custom:An optional additional icon to generate that follows specific custom instructions; ignore if not specified.}

## Output

One or more graphic files representing the described application, saved to `/icons/<format>/icon-<variation-index>-<resolution>.<format-extension>`
