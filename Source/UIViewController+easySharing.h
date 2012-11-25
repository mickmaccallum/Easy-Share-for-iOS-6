//
//  UIViewController+easySharing.h
//  Easy Share for iOS 6
//
//  Created by Michael MacCallum on 11/25/12.
//
//  Accreditation is not required, but is always appreciated.
//
//  This Software is provided on an "AS IS" basis.  I
//  MAKE NO WARRANTIES, EXPRESS OR IMPLIED, INCLUDING WITHOUT LIMITATION
//  THE IMPLIED WARRANTIES OF NON-INFRINGEMENT, MERCHANTABILITY AND FITNESS
//  FOR A PARTICULAR PURPOSE, REGARDING THE SOFTWARE OR ITS USE AND
//  OPERATION ALONE OR IN COMBINATION WITH YOUR PRODUCTS.
//
//  IN NO EVENT SHALL I BE LIABLE FOR ANY SPECIAL, INDIRECT, INCIDENTAL
//  OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
//  SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
//  INTERRUPTION) ARISING IN ANY WAY OUT OF THE USE, REPRODUCTION,
//  MODIFICATION AND/OR DISTRIBUTION OF THE SOFTWARE, HOWEVER CAUSED
//  AND WHETHER UNDER THEORY OF CONTRACT, TORT (INCLUDING NEGLIGENCE),
//  STRICT LIABILITY OR OTHERWISE, EVEN IF I HAVE BEEN ADVISED OF THE
//  POSSIBILITY OF SUCH DAMAGE.
//
//  That being said, you are free to use this code free of charge for absolutely
//  anything you want. You may use this in personal projects, commercial projects
//  or for anything else.

#import <UIKit/UIKit.h>
#import <Social/Social.h>
#import <MessageUI/MessageUI.h>
#import <AssetsLibrary/AssetsLibrary.h>

static NSString *easyShareIgnoredServiceTypeAssignToContact     = @"UIActivityTypeAssignToContact";
static NSString *easyShareIgnoredServiceTypeCopy                = @"UIActivityTypeCopyToPasteboard";
static NSString *easyShareIgnoredServiceTypeMail                = @"UIActivityTypeMail";
static NSString *easyShareIgnoredServiceTypeTextMessage         = @"UIActivityTypeMessage";
static NSString *easyShareIgnoredServiceTypeFacebook            = @"UIActivityTypePostToFacebook";
static NSString *easyShareIgnoredServiceTypeTwitter             = @"UIActivityTypePostToTwitter";
static NSString *easyShareIgnoredServiceTypeSinoWeibo           = @"UIActivityTypePostToWeibo";
static NSString *easyShareIgnoredServiceTypePrint               = @"UIActivityTypePrint";
static NSString *easyShareIgnoredServiceTypeSaveToCameraRoll    = @"UIActivityTypeSaveToCameraRoll";


@interface UIViewController (easySharing)
<
MFMailComposeViewControllerDelegate,
MFMessageComposeViewControllerDelegate,
UINavigationControllerDelegate,
UIPrintInteractionControllerDelegate
>

- (void)easyShareServiceAgnosticWithInputObjects:(NSArray *)sharingObjects;
- (void)easyShareTextWithFacebook:(NSString *)text andImage:(UIImage *)image andURL:(NSURL *)url;
- (void)easyShareTextWithTwitter:(NSString *)text andImage:(UIImage *)image andURL:(NSURL *)url;
- (void)easyShareTextWithSinoWeibo:(NSString *)text andImage:(UIImage *)image andURL:(NSURL *)url;
- (void)easyShareTextWithTextMessage:(NSString *)text andRecipients:(NSArray *)recipients;
- (void)easyShareBodyTextWithMail:(NSString *)bodyText andIsBodyHTML:(BOOL)isHTML andRecipients:(NSArray *)recipients andCcRecipients:(NSArray *)CcRecipients andBccRecipients:(NSArray *)BccRecipients andSubject:(NSString *)subject andAttachmentData:(NSData *)data attachmentDataMIMEtype:(NSString *)mime attechmentDataFileName:(NSString *)fileName;
- (void)easyShareImageByPrinting:(UIImage *)image andData:(NSData *)data andFilePath:(NSString *)file andURL:(NSURL *)url;
- (void)easyShareCopyTextToPasteboard:(NSString *)text andImage:(UIImage *)image andURL:(NSURL *)url andColor:(UIColor *)color;
- (void)easyShareSaveImageToCameraRoll:(UIImage *)image andOrVideoFromURL:(NSURL *)video;

@end
