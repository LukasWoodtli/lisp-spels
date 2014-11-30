
;; M-x eval-buffer for evaluation complete buffer

;; If you did something wrong and Emacs starts showing error messages, you'll want to use the command M-x top-level

(setq eval-expression-print-length nil)

(require 'cl)


(setq objects '(whiskey-bottle bucket frog chain))

      
(setq map '((living-room (you are in the living room of a wizards house - there is a wizard snoring loudly on the couch -)
                         (west door garden)
                         (upstairs stairway attic))
            (garden (you are in a beautiful garden - there is a well in front of you -)
                    (east door living-room))
            (attic (you are in the attic of the wizards house - there is a giant welding torch in the corner -)
                   (downstairs stairway living-room))))


(setq object-locations '((whiskey-bottle living-room)
                          (bucket living-room)
                          (chain garden)
                          (frog gatden)))

(setq location 'living-room)


(defun describe-location (location map)
  (second (assoc location map)))


;(message (describe-location 'living-room map))

(defun describe-path (path)
  `(there is a ,(second path) going ,(first path) from here -))

;(message (describe-path '(west door garden)))

(defun describe-paths (location map)
    (apply #'append (mapcar #'describe-path (cddr (assoc location map)))))


;(message (describe-paths 'living-room map))


(defun is-at (obj loc obj-loc)
  (eq (second (assoc obj obj-loc)) loc))

;(message (is-at 'whiskey-bottle 'living-room object-locations))

;; http://www.lisperati.com/casting-spels-emacs/html/casting-spels-emacs-19.html
