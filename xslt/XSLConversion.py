import lxml.etree as ET
import sys
import re


dom = ET.parse(sys.argv[1])
xslt = ET.parse(sys.argv[2])

transform = ET.XSLT(xslt)
newdom = transform(dom)
newxml = ET.tostring(newdom, pretty_print=True)
replaceMilliseconds = re.sub(r"(\d{4})-(\d{2})-(\d{2})T(\d{2})\:(\d{2})\:(\d{2})\.(\d{3})([+-])(\d{2})\:(\d{2})", r"\1-\2-\3T\4:\5:\6\8\9:\10", newxml, flags=re.MULTILINE)
deleteIndentation   = re.sub('^(\s+)','',replaceMilliseconds, flags=re.MULTILINE)
text_file = open("result.xml", "w")
text_file.write(deleteIndentation)
text_file.close()

