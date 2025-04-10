import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.DocumentBuilder;
import org.w3c.dom.Document;
import org.w3c.dom.NodeList;
import org.w3c.dom.Node;
import org.w3c.dom.Element;
import java.io.File;
import java.util.Arrays;

public record Flags(boolean auto) {
}

void main(String[] args) throws Exception {
	final String feedLocation = "/home/pat/dev/website/blog/feed.xml";

	File feed = new File(feedLocation);
	DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
	DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
	Document doc = dBuilder.parse(feed);
	doc.getDocumentElement().normalize();

	System.out.println(doc.toString());

	Flags f = null;
	for (String arg : args) {
		if (arg.equals("-a") || arg.equals("--auto")) {
			f = new Flags(true);
		}
	}

	println(Arrays.asList(args).toString());
}
