# (New-Object -com Itunes.Application).LibrarySource.Playlists|Select-Object Name,Kind,SpecialKind,Smart
$playLists=((New-Object -com Itunes.Application).LibrarySource.Playlists)

foreach ($playList in $playLists)
{
	$playListName = $playList.Name
	if (($playList.Kind -eq 1) -or ($playList.SpecialKind -eq 4) )
	{
		continue;
	}
	Write-Host "*************************************"
	Write-Host $playListName
	Write-Host "*************************************"

	$tracks = $playList.Tracks
	foreach ($track in $tracks)
	{
		$fullName = $track.Location
		$particalTrack = $fullName -replace "K:\\iTunes\\itunes music\\",""
		Write-Host $particalTrack
	}
}
