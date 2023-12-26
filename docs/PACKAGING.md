# Packaging

To package and upload the project, here's the commands I've used:

```bash
spectra-graph/ $ python3 -m build
spectra-graph/ $ python3 -m twine upload --repository testpypi dist/*
```
