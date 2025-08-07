# CT
Computed Tomography Reconstruction Side Project Code


Finally getting around to hosting at least some kind of copy of this script before I inevitably brick it

Working on documenting it but in a nutshell this is how it works

- I included some sample test files, which were made on blender as a quick replacement for a proper imaging setup

# General Steps:

Point the script at a folder where a set of 360 images are stored with the naming scheme "image (xxx).png" where xxx is 1 thru 360 


Tell the script what the output file should be named


Set the start and ending pixel values (to cut out blank space from the processing, as this goes pixel row by pixel row generating slices)


File will be output as a multi-page tiff ready for use with something such as Slicer 3D
