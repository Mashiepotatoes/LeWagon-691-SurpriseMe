import { Application } from "stimulus"
import CheckboxSelectAll from "stimulus-checkbox-select-all"

const application = Application.start()
application.register("checkbox-select-all", CheckboxSelectAll)
