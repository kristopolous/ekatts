;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;                                                                     ;;;
;;;                     Carnegie Mellon University                      ;;;
;;;                  and Alan W Black and Kevin Lenzo                   ;;;
;;;                      Copyright (c) 1998-2000                        ;;;
;;;                        All Rights Reserved.                         ;;;
;;;                                                                     ;;;
;;; Permission is hereby granted, free of charge, to use and distribute ;;;
;;; this software and its documentation without restriction, including  ;;;
;;; without limitation the rights to use, copy, modify, merge, publish, ;;;
;;; distribute, sublicense, and/or sell copies of this work, and to     ;;;
;;; permit persons to whom this work is furnished to do so, subject to  ;;;
;;; the following conditions:                                           ;;;
;;;  1. The code must retain the above copyright notice, this list of   ;;;
;;;     conditions and the following disclaimer.                        ;;;
;;;  2. Any modifications must be clearly marked as such.               ;;;
;;;  3. Original authors' names are not deleted.                        ;;;
;;;  4. The authors' names are not used to endorse or promote products  ;;;
;;;     derived from this software without specific prior written       ;;;
;;;     permission.                                                     ;;;
;;;                                                                     ;;;
;;; CARNEGIE MELLON UNIVERSITY AND THE CONTRIBUTORS TO THIS WORK        ;;;
;;; DISCLAIM ALL WARRANTIES WITH REGARD TO THIS SOFTWARE, INCLUDING     ;;;
;;; ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS, IN NO EVENT  ;;;
;;; SHALL CARNEGIE MELLON UNIVERSITY NOR THE CONTRIBUTORS BE LIABLE     ;;;
;;; FOR ANY SPECIAL, INDIRECT OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES   ;;;
;;; WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN  ;;;
;;; AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION,         ;;;
;;; ARISING OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF      ;;;
;;; THIS SOFTWARE.                                                      ;;;
;;;                                                                     ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; POS tagger for indic
;;;

;;; Load any necessary files here

;;; Load voice/language specific gpos list if it exists
(if (probe_file (path-append cmu_indic_mar_slp::dir "festvox/cmu_indic_mar_slp_gpos.scm"))
    (begin
      (load (path-append cmu_indic_mar_slp::dir "festvox/cmu_indic_mar_slp_gpos.scm"))
      (set! guess_pos cmu_indic_mar_slp_guess_pos)))

(set! cmu_indic_guess_pos 
'((fn
    ;; function words 
  )
  ;; Or split them into sub classes (but give them meaningful names)
  ; (pos_0 .. .. .. ..)
  ; (pos_1 .. .. .. ..)
  ; (pos_2 .. .. .. ..)
))

(define (cmu_indic_mar_slp::select_tagger)
  "(cmu_indic_mar_slp::select_tagger)
Set up the POS tagger for indic."
  (set! pos_lex_name nil)
  (if (boundp 'cmu_indic_mar_slp_guess_pos)
      (set! guess_pos cmu_indic_mar_slp_guess_pos)   ;; voice specific gpos
      (set! guess_pos english_guess_pos))      ;; default English gpos
)

(define (cmu_indic_mar_slp::reset_tagger)
  "(cmu_indic_mar_slp::reset_tagger)
Reset tagging information."
  t
)

(provide 'cmu_indic_mar_slp_tagger)
