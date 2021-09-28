# PowerShell Script: copy-photos-sorted.ps1
```powershell
copy-photos-sorted.ps1 [<SourceDir>] [<TargetDir>]
```

Copy image files from SourceDir to TargetDir sorted by year and month

## Syntax & Parameters
```powershell
/home/markus/Repos/PowerShell/Scripts/copy-photos-sorted.ps1 [[-SourceDir] <String>] [[-TargetDir] <String>] [<CommonParameters>]
```

```
-SourceDir <String>
    
    Required?                    false
    Position?                    1
    Default value                
    Accept pipeline input?       false
    Accept wildcard characters?  false
```

```
-TargetDir <String>
    
    Required?                    false
    Position?                    2
    Default value                
    Accept pipeline input?       false
    Accept wildcard characters?  false
```

```
[<CommonParameters>]
    This cmdlet supports the common parameters: Verbose, Debug, ErrorAction, ErrorVariable, WarningAction, 
    WarningVariable, OutBuffer, PipelineVariable, and OutVariable.
```

## Example
```powershell
PS>./copy-photos-sorted D:\Mobile\DCIM C:\MyPhotoAlbum
```


## Notes
Author: Markus Fleschutz · License: CC0

## Related Links
https://github.com/fleschutz/PowerShell

*Generated by convert-ps2md.ps1 using the comment-based help of copy-photos-sorted.ps1*