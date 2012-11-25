UIViewController+easySharing

++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

Easy sharing for iOS 6 is a ```UIViewController``` category to make sharing content from within your app as
simple as possible. This category supports multi-service sharing via the ```UIActivityViewController```, or individual
sharing services including: Facebook, Twitter, Sino Weibo, SMS, Email, Pasteboard, Camera Roll, and printing.

This category requires a minimum deployment target of iOS 6.0.

If you haven't used a category before, set up is quite simple. 

Instructions:

Note: Category is included in a sample project, but only ```UIViewController+easySharing.h``` and 
```UIViewController+easySharing.m``` are needed in your project. These files can be located in /Source/

1. drag and drop ```UIViewController+easySharing.h``` and ```UIViewController+easySharing.m``` into your project. 

2. When the "Choose options for adding these file" window comes up, make sure that the "copy items 
into destination group's folder" and "add to targets" check boxes are selected.

3. Add "AssetsLibrary.framework", "MessageUI.framework" and "Social.framework" to your project's "Linked Frameworks and Libraries".

3. Import the categories header in the header file (.h) of your view controller ```#import "UIViewController+easySharing.h"```

4. Go take a coffee break. Just kidding, usage is just as simple as setup, if not simpler! Examples below.

 


Usage Examples:

Let's say you want to share an image, some text and a URL to Facebook. Forget about all that delegation, view controller presenting and dismissing
and service checking! All of this is handled automatically with this category. To share to Facebook simply copy the paste the line of code below
into your project and add your ```NSString```, ```UIImage``` and ```NSURL``` arguments accordingly.

Keep in mind that you can pass ```nil``` to any of these arguments if you don't wish to use it.


    ```[self easyShareTextWithFacebook:<#(NSString *)#> andImage:<#(UIImage *)#> andURL:<#(NSURL *)#>];```



If you aren't sure what to do with the line of code above, here's a more detailed example.

    ```UIImage *myImage = [UIImage imageNamed:@"myAwesomeSharingImage"];```
    ```NSString *myString = @"Some sweet text that I want to share";```
    ```NSURL *myURL = [NSURL urlWithString:@"http://www.google.com/"];```

    ```[self easyShareTextWithFacebook:myString andImage:myImage andURL:myURL];```

If for example, you only wish to share a photo, you can pass ```nil``` to the arguments for text and URL.

    ```[self easyShareTextWithFacebook:nil andImage:myImage andURL:nil];```


To present a ```UIActivityViewController``` displaying all available sharing options use:

    ```[self easyShareServiceAgnosticWithInputObjects:<#(NSArray *)#>];```

**Please note, printing is untested because I do not own an AirPrint compatible printer. Please let me know if you have any problems.


This should be all you need to successfully integrate this category into your project. All other built in sharing options follow these same rules.
If you have any questions of concerns, please email me at MacCDevTeam (AT) gmail.com. A full list of included sharing options can be found below.


Sharing Options:







Created by Michael MacCallum on 11/25/12.

Accreditation is not required, but is always appreciated.

This Software is provided on an "AS IS" basis.  I
MAKE NO WARRANTIES, EXPRESS OR IMPLIED, INCLUDING WITHOUT LIMITATION
THE IMPLIED WARRANTIES OF NON-INFRINGEMENT, MERCHANTABILITY AND FITNESS
FOR A PARTICULAR PURPOSE, REGARDING THE SOFTWARE OR ITS USE AND
OPERATION ALONE OR IN COMBINATION WITH YOUR PRODUCTS.

IN NO EVENT SHALL I BE LIABLE FOR ANY SPECIAL, INDIRECT, INCIDENTAL
OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
INTERRUPTION) ARISING IN ANY WAY OUT OF THE USE, REPRODUCTION,
MODIFICATION AND/OR DISTRIBUTION OF THE SOFTWARE, HOWEVER CAUSED
AND WHETHER UNDER THEORY OF CONTRACT, TORT (INCLUDING NEGLIGENCE),
STRICT LIABILITY OR OTHERWISE, EVEN IF I HAVE BEEN ADVISED OF THE
POSSIBILITY OF SUCH DAMAGE.

That being said, you are free to use this code free of charge for absolutely
anything you want. You may use this in personal projects, commercial projects
or for anything else.