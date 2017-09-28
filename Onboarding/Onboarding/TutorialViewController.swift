import UIKit

class TutorialViewController: UIViewController {

    @IBOutlet weak var contianerView: UIView!

    @IBOutlet weak var pageControl: UIPageControl!
    
    var tutorialPageViewController: TutorialPageViewController? {
        didSet {
            tutorialPageViewController?.tutorialDelegate = self
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        pageControl.addTarget(self, action: #selector(TutorialViewController.didChangePageControlValue), for: .valueChanged)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let tutorialPageViewController = segue.destination as? TutorialPageViewController {
            self.tutorialPageViewController = tutorialPageViewController
        }
    }


    func didChangePageControlValue() {
        tutorialPageViewController?.scrollToViewController(index: pageControl.currentPage)
    }
}

extension TutorialViewController: TutorialPageViewControllerDelegate {

    func tutorialPageViewController(_ tutorialPageViewController: TutorialPageViewController, didUpdatePageCount count: Int) {
        pageControl.numberOfPages = count
    }

    func tutorialPageViewController(_ tutorialPageViewController: TutorialPageViewController, didUpdatePageIndex index: Int) {
        pageControl.currentPage = index
    }
    
}
