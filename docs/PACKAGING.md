# <img src='https://github.com/adriandavila/spectra-graph/blob/main/docs/assets/logo/icon.png?raw=true' width='30' alt="Spectra-Graph Logo"> Packaging

To package and upload the project, here's the commands I've used:

```bash
spectra-graph/ $ python3 -m build
spectra-graph/ $ python3 -m twine upload --repository testpypi dist/*
```
