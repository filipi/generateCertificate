# generateCertificate

A simple bash script to generate a course or event certificates based on a SVG template.

## Use
./generateCertificate.sh fileWithParticipantsNames stringWitTheParticipantRole

## Example

Suposing the file input.txt contains the names of the participants os a congress.
We want to generate certificates saying they were listneres at the event

./generateCertificate.sh input.txt listener

This way the PDF files with the certificate for each participant will be
saved at the certificatsFolder.

