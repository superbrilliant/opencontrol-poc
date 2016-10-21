# Remove yaml directory managed by compliance-masonry.
clean:
	rm -rf ./opencontrols ./exports ./ssp.pdf

# Re-fetch dependencies and organize opencontrol yaml.
get: clean
	compliance-masonry get

# Create a pdf containing compliance documentation.
pdf: get
	compliance-masonry docs gitbook lightweight-ato
	gitbook pdf ./exports/ ./ssp.pdf

# List unimplemented controls
diff: get
	compliance-masonry diff lightweight-ato
