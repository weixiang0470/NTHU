# **Dataset**
- From [NASA Exoplanet Archive](https://exoplanetarchive.ipac.caltech.edu/index.html)
    - [Light curve source](https://exoplanetarchive.ipac.caltech.edu/docs/Kepler_KOI_docs.html)
        - [Document](https://exoplanetarchive.ipac.caltech.edu/docs/KSCI-19113-001.pdf)
    - [KOI-table source](https://exoplanetarchive.ipac.caltech.edu/cgi-bin/TblView/nph-tblView?app=ExoTbls&config=q1_q17_dr25_sup_koi)
# **Requirement**
- numpy <=2.0
- pandas
- tsfresh
- glob
# Warnings
1. Warning message showed below:
    - Happen on macOS(Macbook air 2020)
    - Cause by `tsfresh.extract_features`
```
python(70769) MallocStackLogging: can't turn off malloc stack logging because it was not enabled.
python(70770) MallocStackLogging: can't turn off malloc stack logging because it was not enabled.
python(70771) MallocStackLogging: can't turn off malloc stack logging because it was not enabled.
python(70772) MallocStackLogging: can't turn off malloc stack logging because it was not enabled.
```
- Solution:
    - Restart kernel and execute the code below first
    - `os.environ["MallocStackLogging"] = "0"`

# File handling
1. `find koi{248..443}.n -type f ! -name 'tremove*' -exec rm {} \; `
    - Delete all files that do not start with "tremove" in all **koi248.n** to **koi443.n** folders
    - 278 & 357 does not exist
- 248-258:101m
- 280-300:46m
- 301-443:320m